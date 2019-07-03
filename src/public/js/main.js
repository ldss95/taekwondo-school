document.addEventListener('DOMContentLoaded', function (e) {
	//document.querySelector('#toggle_menu').addEventListener('click', () => toggleMenu())
	$('nav#main_menu').slideAndSwipe()
	document.querySelector("#main_menu ul li a[href='/#cursos']").addEventListener('click', function () {
		this.classList.add('active')
		toggleMenu()
		document.querySelector("#main_menu ul li a.active").classList.remove('active')
	})

	document.querySelector('#FLogin').addEventListener('submit', function (e) {
		e.preventDefault()
		let datos = serialize(this)
		axios.post('/API/usuarios/login', datos)
			.then(res => {
				if (typeof res.data == 'object') {
					vue.session = res.data
					this.reset()
					$('#MLogin').modal('hide')
				} else {
					let login_error = document.querySelector('#login_error')
					login_error.innerHTML = res.data
					login_error.classList.add('show')
					setTimeout(() => {
						login_error.classList.remove('show')
					}, 5000)
				}
			}).catch(error => {
				console.log(error)
			})
	})

	document.querySelector('#newsletter').addEventListener('submit', e => {
		e.preventDefault()
		let email = e.target.querySelector('input').value
		let spinner = e.target.querySelector('span')
		spinner.classList.remove('d-none')
		axios.post('/API/newsletter', {
			email
		}).then(res => {
			spinner.classList.add('d-none')
			if (res.data == true) {
				e.target.querySelector('input').value = ''
				swal.fire(
					'Listo!',
					'Recibirá notificaciones por correo sobre informaciones de interes, gracias por utilizar nuestros servicios.',
					'success'
				)
			} else {
				swal.fire(
					'Oops!',
					res.data,
					'warning'
				)
			}
		}).catch(error => {
			spinner.classList.add('d-none')
			swal.fire(
				'Error',
				'No hemos podido almacenar su email, disculpe los inconvenientes',
				'error'
			)
			console.error(error)
		})
	})

	//Aunto hide header on scroll
	var doc = document.documentElement;
	var w = window;

	var prevScroll = w.scrollY || doc.scrollTop;
	var curScroll;
	var direction = 0;
	var prevDirection = 0;

	var header = document.querySelector('header#main_header');

	var checkScroll = function () {
		/*
		** Find the direction of scroll
		** 0 - initial, 1 - up, 2 - down
		*/

		curScroll = w.scrollY || doc.scrollTop;
		if (curScroll > prevScroll) {
			//scrolled up
			direction = 2;
		}
		else if (curScroll < prevScroll) {
			//scrolled down
			direction = 1;
		}

		if (direction !== prevDirection) {
			toggleHeader(direction, curScroll);
		}

		prevScroll = curScroll;
	};

	var toggleHeader = function (direction, curScroll) {
		if (direction === 2 && curScroll > 52) {
			header.classList.add('hide');
			prevDirection = direction;
		}
		else if (direction === 1) {
			header.classList.remove('hide');
			prevDirection = direction;
		}
	};

	window.addEventListener('scroll', checkScroll);

	$(".tel").mask("999-999-9999")
	$(".rnc").mask("9-99-99999-9")
	$(".dui").mask("999-9999999-9")
})

function toggleMenu() {
	let activo = document.querySelector('nav#main_menu').classList.contains('active')
	let button = document.querySelector('#toggle_menu')
	if (activo) {
		document.querySelector('nav#main_menu').classList.remove('active')
		button.classList.remove('active')
	} else {
		document.querySelector('nav#main_menu').classList.add('active')
		button.classList.add('active')
	}
}

function format(input, type, decimals = true) {
	let output = ''
	switch (type) {
		case 'tel':
			let tel = input.toString().replace(' ', '')
			tel = tel.replace('-', '')
			output = `(${tel.substr(0, 3)}) ${tel.substr(3, 3)}-${tel.substr(6, 4)}`
			break;
		case 'cash':
			output = (decimals)
				? (input).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')
				: input.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
			break;
		case 'fecha':
			var aFecha = input.split('-');
			var anio = aFecha[0];
			var dia = aFecha[2];
			var mes = aFecha[1];
			var date = new Date(anio, mes - 1, dia);
			var diaSemana = date.getUTCDay();

			switch (diaSemana) {
				case 1:
					diaSemana = 'Lunes';
					break;
				case 2:
					diaSemana = 'Martes';
					break;
				case 3:
					diaSemana = 'Miercoles';
					break;
				case 4:
					diaSemana = 'Jueves';
					break;
				case 5:
					diaSemana = 'Viernes';
					break;
				case 6:
					diaSemana = 'Sabado';
					break;
				case 0:
					diaSemana = 'Domingo';
					break;
			}

			switch (mes) {
				case '01':
					mes = 'Enero';
					break;
				case '02':
					mes = 'Febrero';
					break;
				case '03':
					mes = 'Marzo';
					break;
				case '04':
					mes = 'Abril';
					break;
				case '05':
					mes = 'Mayo';
					break;
				case '06':
					mes = 'Junio';
					break;
				case '07':
					mes = 'Julio';
					break;
				case '08':
					mes = 'Agosto';
					break;
				case '09':
					mes = 'Septiembre';
					break;
				case '10':
					mes = 'Octubre';
					break;
				case '11':
					mes = 'Noviembre';
					break;
				case '12':
					mes = 'Diciembre';
					break;
			}

			//output = diaSemana+' '+dia+' de '+mes+' '+anio;
			output = dia + ' de ' + mes + ' ' + anio;
			break;
	}

	return output;
}

function serialize(form) {
	let output = {}
	form.querySelectorAll('input, textarea').forEach(input => {
		output[input.getAttribute('name')] = input.value
	})

	return output
}

function logout() {
	axios.get('/API/usuarios/logout')
		.then(res => {
			cargarSesion()
		}).catch(error => {
			console.error(error)
		})
}

function cargarSesion() {
	axios.get('/API/usuarios/session')
		.then(res => {
			vue.session = res.data
		}).catch(error => {
			console.log(error)
		})
}

function validarCedula(cedula) {
	let valida = false
	if (cedula.length == 11) {
		let multiplicado_binario = 1
		let suma = 0

		for (let i = 0; i < 10; i++) {
			let num = parseInt(cedula.substr(i, 1))
			let pre_suma = num * multiplicado_binario;
			if (pre_suma.toString().length == 2) {
				suma += parseInt(pre_suma.toString().substr(0, 1))
				suma += parseInt(pre_suma.toString().substr(1, 1))
			} else
				suma += pre_suma;

			multiplicado_binario = (multiplicado_binario == 1) ? 2 : 1;
		}

		if (suma.toString().substr(1, 1) == '0' && cedula.substr(10, 1) == '0' ||
			((parseInt(suma.toString().substr(0, 1)) + 1) * 10 - suma) == parseInt(cedula.substr(10, 1)))
			valida = true;
	}

	return valida
}