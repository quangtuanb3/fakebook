function formInput(props, index) {
    if (props.type === 'select') {
        return formSelect(props, index);
    }

    const patternAttr = props.pattern  ? `pattern =${props.pattern}` : '';
    const valueAttr = props.value ? `value="${props.value}"` : '';
    const requiredAttr = props.required ? "required" : '';

    // Add "col-6" class to form-row to make two input elements per row
    return `
        <div class="form-group col-6 ${props.classDiv}">
            <div class="form-row">
                <label for="${props.name}">${props.label}:</label>
                <input class="input-custom" type="${props.type || 'text'}" id="${props.name}" name="${props.name}" 
                       onblur="onFocus(${index})" ${patternAttr} ${valueAttr} ${requiredAttr}>
                <span class="error">${props.message}</span>
            </div>
        </div>
    `;
}


function formSelect(props, index) {
    const optionsStr = props.options.map(option => {
        const selected = option.value === props.value ? 'selected' : '';
        return `<option value="${option.value}" ${selected}>${option.name}</option>`;
    }).join('');

    return `
        <div class="form-group col-6">
            <div class="form-row">
                <label for="${props.name}">${props.label}:</label>
                <select  class="input-custom" id="${props.name}" name="${props.name}" 
                        onblur="onFocus(${index})" ${props.required ? "required" : ''}>
                    ${optionsStr}
                </select>
                <span class="error">${props.message}</span>
            </div>
        </div>
    `;
}
const onFocus = (index) => {
    const inputsForm = document.querySelectorAll('#formBody .input-custom')
    inputsForm[index].setAttribute("focused", "true");
}

document.addEventListener('invalid', (function () {
    console.log("Out Invalid")
    return function (e) {
        console.log("Invalid")
        e.preventDefault();
        e.target.onblur();
    };
})(), true);


