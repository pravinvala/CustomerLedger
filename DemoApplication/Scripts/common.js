function isNumberWithDecimalKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode != 46 && charCode > 31
        && (charCode < 48 || charCode > 57))
        return false;

    return true;
}

function formatDate(dateTime) {
    var dt = moment.utc(dateTime, "dd/mm/yy").local().format('ll');
    return dt !== "Invalid date" ? dt : "";
}