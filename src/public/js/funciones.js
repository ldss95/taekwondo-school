function format(input, type, decimals = true) {
	let output = ''
	switch (type) {
		case 'tel':
			let tel = input.toString().replace(' ', '')
			tel = tel.replace('-', '')
			output = `(${tel.substr(0, 3)}) ${tel.substr(3, 3)}-${tel.substr(6, 4)}`
			break;
		case 'cash':
			output =  (decimals) 
				? (input).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')
				: input.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
			break;
	}

	return output;
}

function serialize(form){
	let output = {}
	form.querySelectorAll('input, textarea').forEach(input => {
		output[input.getAttribute('name')] = input.value
	})

	return output
}