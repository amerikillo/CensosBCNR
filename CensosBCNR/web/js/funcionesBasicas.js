/*
 * 
 * @returns {undefined}
 */



function tabular(e, obj)
{
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla !== 13)
        return;
    frm = obj.form;
    for (i = 0; i < frm.elements.length; i++)
        if (frm.elements[i] === obj)
        {
            if (i === frm.elements.length - 1)
                i = -1;
            break
        }
    /*ACA ESTA EL CAMBIO*/
    if (frm.elements[i + 1].disabled === true)
        tabular(e, frm.elements[i + 1]);
    else
        frm.elements[i + 1].focus();
    return false;
}

function isNumberKey(evt, obj)
{
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode === 13 || charCode > 31 && (charCode < 48 || charCode > 57)) {
        if (charCode === 13) {
            frm = obj.form;
            for (i = 0; i < frm.elements.length; i++)
                if (frm.elements[i] === obj)
                {
                    if (i === frm.elements.length - 1)
                        i = -1;
                    break
                }
            /*ACA ESTA EL CAMBIO*/
            if (frm.elements[i + 1].disabled === true)
                tabular(e, frm.elements[i + 1]);
            else
                frm.elements[i + 1].focus();
            return false;
        }
        return false;
    }
    return true;

}


otro = 0;
function LP_data() {
    var key = window.event.keyCode;//codigo de tecla. 
    if (key < 48 || key > 57) {//si no es numero 
        window.event.keyCode = 0;//anula la entrada de texto. 
    }
}
function anade(esto) {
    if (esto.value.length === 0) {
        if (esto.value.length == 0) {
            esto.value += "(";
        }
    }
    if (esto.value.length > otro) {
        if (esto.value.length == 4) {
            esto.value += ") ";
        }
    }
    if (esto.value.length > otro) {
        if (esto.value.length == 9) {
            esto.value += "-";
        }
    }
    if (esto.value.length < otro) {
        if (esto.value.length == 4 || esto.value.length == 9) {
            esto.value = esto.value.substring(0, esto.value.length - 1);
        }
    }
    otro = esto.value.length
}

function areaFarm() {
    var lr = document.form_a.anchoFarm.value;
    var an = document.form_a.largoFarm.value;
    if (lr === "")
        lr = 0;
    if (an === "")
        an = 0;
    var largo = parseInt(lr);
    var ancho = parseInt(an);
    var area = (largo * ancho);
    //alert (area);
    document.form_a.campo_53.value = ancho + "x" + largo + "=" + area;
}


function areaAlm() {
    var lr = document.form_a.anchoAlm.value;
    var an = document.form_a.largoAlm.value;
    if (lr === "")
        lr = 0;
    if (an === "")
        an = 0;
    var largo = parseInt(lr);
    var ancho = parseInt(an);
    var area = (largo * ancho);
    //alert (area);
    document.form_a.campo_59.value = ancho + "x" + largo + "=" + area;
}