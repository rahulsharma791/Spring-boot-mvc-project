var loadFile = function (event) {
    var output = document.getElementById('signature');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function () {
        URL.revokeObjectURL(output.src) // free memory
    }
};

var loadFile1 = function (event) {
    var output = document.getElementById('photo');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function () {
        URL.revokeObjectURL(output.src) // free memory
    }
};

window.onload = (event) => {
    document.getElementById('dateOfBirth').value = new Date().toISOString().substring(0, 10);
    document.getElementById("keyword").focus();
};

function openForm() {
    document.getElementById("myForm").style.display = "block";
}

function closeForm() {
    document.getElementById("myForm").style.display = "none";
}

function openViewForm(rollNumber) {
    document.getElementById("heading").style.display = "none";
    document.getElementById("searchBarPopup").style.display = "none";
    document.getElementById("student_list123").style.display = "none";
    document.getElementById("viewForm").style.display = "block";

    $.ajax({
        async: false,
        type: 'GET',
        url: '/fetch_By_Id/' + rollNumber,
        success: function (data) {
            console.log('success', data);
            $("#rollNumber").val(data.srollNo);
            $("#fullname").val(data.sname);
            $("#fatherName").val(data.fatherName);
            $("#motherName").val(data.motherName);
            $("#email").val(data.email);
            $("#qualification").val(data.qualification);
            $("#rollNo").val(data.rollNo);
            $("#gender").val(data.gender);
            $("#dateOfBirth").val(data.dateOfBirth);
            $("#maritalStatus").val(data.maritalStatus);
            $("#plotNo").val(data.address.plotNo);
            $("#mobileNo").val(data.mobileNo);
            $("#city").val(data.address.city);
            $("#district").val(data.address.district);
            $("#state").val(data.address.state);
            $("#pinCode").val(data.address.pinCode);
            $("#photo").attr("src", "data:image/*;base64," + data.studentPhotoStr);
            $("#signature").attr("src", "data:image/*;base64," + data.studentSignatureStr);
        },
        error: function (data) {
            console.log('error', data)
        }
    });
}


function closeViewForm() {
    document.getElementById("heading").style.display = "block";
    document.getElementById("searchBarPopup").style.display = "block";
    document.getElementById("student_list123").style.display = "block";
    document.getElementById("viewForm").style.display = "none";
}

function deleteById(rollNumber) {
    $.ajax({
        async: false,
        url: '/deleteById/' + rollNumber,
        type: 'DELETE',
        success: function (result) {
            console.log('success', result);
            window.location.reload();
        },
        error: function (result) {
            console.log('error', result);
        }
    });
}

function searchFunc() {
    var searchText = $("#keyword").val()
    var studentList = ""
    $.ajax({
        async: false,
        url: "/studentList/" + searchText,
        type: 'GET',
        success: function (result) {
            studentList = result
            console.log(studentList)
        },
        error: function (result) {
            console.log('error', result);
        }
    });
    return studentList;
}

const searchFun = () => {
    let filter = document.getElementById('keyword').value.toUpperCase();
    let myTable = document.getElementById('student_list123')
    let tr = myTable.getElementsByTagName('tr')
    for (var i = 0; i < tr.length; i++) {
        let td = tr[i].getElementsByTagName('td')[0]
        if (td) {
            let textValue = td.textContent || td.innerHTML;
            if (textValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}
