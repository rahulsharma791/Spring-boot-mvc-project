var loadFile = function(event) {
    var output = document.getElementById('output1');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
        URL.revokeObjectURL(output.src) // free memory
    }
};

var loadFile1 = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
        URL.revokeObjectURL(output.src) // free memory
    }
};

window.onload = (event) =>{
    document.getElementById('dateOfBirth').value = new Date().toISOString().substring(0, 10);
};


function validate(){

    var firstName = $("#firstName").val();
    var isValidationFail = false;
    if (firstName=="") {
        $("#firstNameError").text("please enter first name.")
        isValidationFail = true;
    }else if (!firstName.match("[A-Za-z_ ]{3,}")){
        $("#firstNameError").text("please enter the match pattern.")
        isValidationFail = true;
    }
    else{
        $("#firstNameError").text("")
    }

    var lastName = $("#lastName").val();
    if (lastName=="") {
        $("#lastNameError").text("please enter last name.")
        isValidationFail = true;
    }else if (!lastName.match("[A-Za-z_ ]{3,}")){
        $("#lastNameError").text("please enter the match pattern.")
        isValidationFail = true;
    }else{
        $("#lastNameError").text("")
    }

    var fatherName = $("#fatherName").val();
    if (fatherName=="") {
        $("#fatherNameError").text("please enter father name.")
        isValidationFail = true;
    }else if (!fatherName.match("[A-Za-z_ ]{3,}")){
        $("#fatherNameError").text("please enter the match pattern.")
        isValidationFail = true;
    }else{
        $("#fatherNameError").text("")
    }

    var motherName = $("#motherName").val();
    if (motherName=="") {
        $("#motherNameError").text("please enter mother name.")
        isValidationFail = true;
    }else if (!motherName.match("[A-Za-z_ ]{3,}")){
        $("#motherNameError").text("please enter the match pattern.")
        isValidationFail = true;
    }else{
        $("#motherNameError").text("")
    }

    var email = $("#email").val();
    if (email=="") {
        $("#emailError").text("please enter email address.")
        isValidationFail = true;
    }else if (!email.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)){
        $("#emailError").text("please enter the match pattern.")
        isValidationFail = true;
    }else if (emailExistFunc(email)){
        $("#emailError").text("email already exist.")
        isValidationFail = true;
    }else{
        $("#emailError").text("")
    }

    var mobileNo = $("#mobileNo").val();
    if (mobileNo=="") {
        $("#numberError").text("please enter mobile number.")
        isValidationFail = true;
    }else if (!mobileNo.match(/^([768]{1})+([0-9]{9})+$/)){
        $("#numberError").text("please enter the match pattern.")
        isValidationFail = true;
    }else if (mobileNoExistFunc(mobileNo)){
        $("#numberError").text("mobile number already exist.")
        isValidationFail = true;
    }else{
        $("#numberError").text("")
    }

    var rollNo = $("#rollNo").val();
    if (rollNo=="") {
        $("#rollNoError").text("please enter roll number.")
        isValidationFail = true;
    }else if (!rollNo.match("[a-zA-Z0-9]{3,}")){
        $("#rollNoError").text("please enter the match pattern.")
        isValidationFail = true;
    }else{
        $("#rollNoError").text("")
    }

    const date1 = new Date($("#dateOfBirth").val());
    const date2 = new Date();
    const diffTime = Math.abs(date2 - date1);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

    const diffYear = diffDays/365

    if(diffYear<18){
        $("#DOBError").text("invalid age criteria(should be >=18 year).")
        isValidationFail = true;
    }else {
        $("#DOBError").text("")
    }

    var plotNo = $("#plotNo").val();
    if (plotNo=="") {
        $("#plotNoError").text("please enter plot number.")
        isValidationFail = true;
    }else if (!plotNo.match("[a-zA-Z0-9]{2,}")){
        $("#plotNoError").text("please enter the match pattern.")
        isValidationFail = true;
    }else{
        $("#plotNoError").text("")
    }

    var city = $("#city").val();
    if (city=="") {
        $("#cityError").text("please enter city.")
        isValidationFail = true;
    }else if (!city.match("[a-zA-Z0-9]{3,}")){
        $("#cityError").text("please enter the match pattern.")
        isValidationFail = true;
    }else{
        $("#cityError").text("")
    }

    var district = $("#district").val();
    if (district=="") {
        $("#districtError").text("please enter district.")
        isValidationFail = true;
    }else if (!district.match("[a-zA-Z0-9]{3,}")){
        $("#districtError").text("please enter the match pattern.")
        isValidationFail = true;
    }else{
        $("#districtError").text("")
    }

    var state = $("#state").val();
    if (state=="") {
        $("#stateError").text("please enter state.")
        isValidationFail = true;
    }else if (!state.match("[a-zA-Z0-9]{3,}")){
        $("#stateError").text("please enter the match pattern.")
        isValidationFail = true;
    }else{
        $("#stateError").text("")
    }

    var pinCode = $("#pinCode").val();
    if (pinCode=="") {
        $("#pinCodeError").text("please enter pin code number.")
        isValidationFail = true;
    }else if (!pinCode.match("[0-9]{6}")){
        $("#pinCodeError").text("please enter the match pattern.")
        isValidationFail = true;
    }else{
        $("#pinCodeError").text("")
    }

    var studentPhoto = $("#studentPhoto").val();
    if (studentPhoto=="") {
        $("#studentPhotoError").text("please enter student photo.")
        isValidationFail = true;
    }else{
        $("#studentPhotoError").text("")
    }

    var studentSignature = $("#studentSignature").val();
    if (studentSignature=="") {
        $("#studentSignatureError").text("please enter student signature.")
        isValidationFail = true;
    }else{
        $("#studentSignatureError").text("")
    }

    if (isValidationFail == true) {
        return false;
    }else {
        if (confirm('Are you sure you want to save this student into the database?')) {
            console.log('Thing was saved to the database.');
            JSconfirm();
            return true;
        } else {
            console.log('Thing was not saved to the database.');
            return false;
        }

    }

}

function emailExistFunc(email){
    var emailAlreadyExist = false;
    $.ajax({
        async: false,
        type: 'GET',
        url: '/emailAlreadyExist/'+email,
        success: function (result) {
            if (result==true){ emailAlreadyExist = true;}
        },
        error: function (result) {
            console.log("error",result)
        }
    });
    return emailAlreadyExist;
}

function mobileNoExistFunc(mobileNo){
    var isMobileNoAlreadyExist = false;
    $.ajax({
        async: false,
        type: 'GET',
        url: '/mobileNoAlreadyExist/'+mobileNo,
        success: function (result) {
            if (result==true){ isMobileNoAlreadyExist = true;}
        },
        error: function (result) {
            console.log("error",result)
        }
    });
    return isMobileNoAlreadyExist;
}