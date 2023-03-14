<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>fetch student</title>
    <link href="/css/student_list.css" rel="stylesheet" type="text/css">
    <link rel="icon" href=
            "https://cdn.vectorstock.com/i/1000x1000/62/68/india-flag-round-shape-vector-45046268.webp"
          type="image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Amita&family=Gloock&family=Noto+Sans:wght@100&family=Tillana:wght@700&display=swap"
          rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body>
<div style="background-color: burlywood">
    <table>
        <tbody>
        <tr style="background-color: #4e3b23">
            <td>
                <img class="logo"
                     src="https://www.logopeople.in/blog/wp-content/uploads/2013/01/government-of-india.jpg">
            </td>
            <td>
                <table>
                    <tbody>
                    <tr style="background-color: bisque">
                        <td class="topHeading"><b>Government of India</b></td>
                    </tr>
                    <tr style="background-color: bisque">
                        <td>
                            <p1>A National Portal Of India</p1>
                            <a class="readMore" href="https://www.google.com/">Read More</a>
                        </td>
                    </tr>
                    </tbody>
                </table>

            </td>

        </tr>

        </tbody>
    </table>

    <div class="heading" id="heading">
        <table style="background-color: white">
            <tr style="background-color: bisque">
                <td>
                    <button onclick="history.back()" style="border: none;background-color: bisque">Go Back</button>
                </td>
                <td style="column-width: 1176px"><b>Student Table</b></td>
            </tr>
        </table>
    </div>
</div>
<div id="searchBarPopup">
    <form th: action="student_list" method="get" style="background-color: cornsilk">
        <input type="text" name="keyword" id="keyword" onkeyup="searchFunc()" value="${searchText}">
        <button type="submit">Go</button>
    </form>
    <button class="open-button" onclick="openForm()">Add New</button>
</div>
<div class="form-popup" id="myForm">

    <form tr: action="register_form" class="form-container">
        <h1>Login</h1>

        <label for="email"><b>Email</b></label>
        <input type="text" placeholder="Enter Email" name="email" required>

        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="psw" required>

        <button type="submit" class="btn">Login</button>
        <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
    </form>

</div>
<table class="studentListTable" id="student_list123" border="1" align="center">

    <caption style="caption-side: top">Table 1 : All Student List</caption>
    <tbody>
    <tr class="tableRow">
        <th class="header" style="width: 10%">
            Roll Number
        </th>
        <th class="headerPhoto" style="width: 3%">
            Photo
        </th>
        <th class="header" style="width: 29%">
            Name
        </th>
        <th class="header" style="width: 29%">
            Email Address
        </th>
        <th class="header" style="width: 29%">
            Action
        </th>
    </tr>

    <c:forEach var="std" items="${students}">

        <tr>
            <td class="coloumnWidth">
                    ${std.SRollNo}
            </td>
            <td class="coloumnImg">
                <img src='data:image/*;base64,${std.studentPhotoStr}' style="width: 100%">
            </td>
            <td class="coloumnWidth">
                    ${std.name}
            </td>
            <td class="coloumnWidth">
                    ${std.email}
            </td>
            <td class="coloumnWidth">
                <span><a class="viewButton" onclick="openViewForm(${std.SRollNo})">View</a></span>
                <span>&nbsp</span>
                <span><a class="deleteButton" onclick="deleteById(${std.SRollNo})">Delete</a></span>

            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>

<div class="view-popup" id="viewForm">
    <form id="updateForm" class="view-form-container">

        <h1 style="font-size:31px;color: brown;text-align: center;border: none;"><b>Student Details</b></h1>

        <div class="form-item">
            <table>
                <tr>
                    <td>
                        <label for="studentPhoto"> Student Photo:</label>
                    </td>
                    <td>
                        <img class="photo" id="photo" src="http://placehold.it/180" alt="your photo"/>
                        <input type="file" name="studentPhoto" id="studentPhoto" accept="image/*"
                               onchange="loadFile1(event)">
                        <label for="studentPhoto">Change Photo</label>
                        <label id="studentPhotoError" class="error" for="photo"></label><br>
                        <img class="signature" id="signature" src="http://placehold.it/180" alt="your signature"/>

                        <input type="file" name="studentSignature" id="studentSignature"
                               accept="image/*" onchange="loadFile(event)">
                        <label for="studentSignature">Change Signature</label>
                        <div><label id="studentSignatureError" class="error" for="signature"></label></div>
                    </td>
                </tr>
            </table>

        </div>

        <div class="form-item">
            <label for="rollNumber"> Roll Number:</label>
            <input type="text" class="text" name="rollNumber" id="rollNumber">
        </div>

        <div class="form-item">
            <label for="fullname">Student Name:</label>
            <input type="text" name="fullname" id="fullname" placeholder="Full Name">
            <div><label id="fullNameError" class="error" for="fullname"></label></div>
        </div>

        <div class="form-item">
            <label for="fatherName">Father Name:</label>
            <input type="text" class="text" name="fatherName" id="fatherName">
            <div><label id="fatherNameError" class="error" for="fatherName"></label></div>
        </div>

        <div class="form-item">
            <label for="motherName">Mother Name:</label>
            <input type="text" class="text" name="motherName" id="motherName">
            <div><label id="motherNameError" class="error" for="motherName"></label></div>
        </div>

        <div class="form-item">
            <label for="email">Mother Name:</label>
            <input type="email" class="text" name="email" id="email">
            <div><label id="emailError" class="error" for="email"></label></div>
        </div>

        <div class="form-item">
            <label for="mobileNo">MobileNumber:</label>
            <span style="margin-left: 0px">+91-</span>
            <input type="tel" class="text" name="mobileNo" id="mobileNo">
            <div><label id="mobileNoError" class="error" for="mobileNo"></label></div>
        </div>

        <div class="form-item">
            <label for="qualification">Qualification:</label>
            <select name="qualification" class="text" id="qualification">
                <option value="B.Tech" name="qualification">B.Tech</option>
            </select>
        </div>

        <div class="form-item">
            <label for="rollNo">B.Tech Roll Number:</label>
            <input type="text" class="text" name="rollNo" id="rollNo">
            <div><label id="rollNoError" class="error" for="rollNo"></label></div>
        </div>

        <div class="form-item">
            <label for="dateOfBirth">Date of Birth:</label>
            <input type=date class="text" id=dateOfBirth name="dateOfBirth">
            <div><label id="dateOfBirthError" class="error" for="dateOfBirth"></label></div>
        </div>

        <div class="form-item">
            <label for="maritalStatus">Marital Status:</label>
            <select name="maritalStatus" class="text" id="maritalStatus"
                    style="width: 84px;background-color: bisque;border: none">
                <option value="">-Select Marital Status-</option>
                <option value="Single" selected>Single</option>
                <option value="Married">Married</option>
                <option value="Widowed">Widowed</option>
                <option value="Separated">Separated</option>
                <option value="Divorced">Divorced</option>
            </select>

        </div>
        <hr style="width: 100%">

        <div class="form-item">
            <fieldset>
                <legend>
                    Address:
                </legend>
                <label for="plotNo">Plot number:</label>
                <input type="text" class="text" name="plotNo" id="plotNo">
                <div><label id="plotNoError" class="error" for="plotNo"></label></div>
                <label for="city">City:</label>
                <input type="text" class="text" id="city" name="city">
                <div><label id="cityError" class="error" for="city"></label></div>
                <label for="district">District:</label>
                <input type="text" class="text" name="district" id="district">
                <div><label id="districtError" class="error" for="district"></label></div>
                <label for="state">State:</label>
                <input type="text" class="text" name="state" id="state">
                <div><label id="stateError" class="error" for="state"></label></div>
                <label for="pinCode">PinCode:</label>
                <input type="text" class="text" name="pinCode" id="pinCode">
                <div><label id="pinCodeError" class="error" for="pinCode"></label></div>
            </fieldset>
        </div>
        <div class="form-item">
            <button type="submit" class="updateBtn">Update</button>
            <button type="button" class="deleteBtn cancel" onclick="closeViewForm()">Close</button>
        </div>

        <table>
            <tr>
                <td>
                <td>

                </td>
                </td>
            </tr>


        </table>

    </form>
</div>
</body>
</html>
<script type="text/javascript" src="/js/student_list.js"></script>

<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>

<script>
    $("#updateForm").validate({
        rules: {
            fullname: {
                required: true,
                pattern: "[a-zA-Z_ ]{3,}"
            },
        }, messages: {
            fullname: {
                required: "Please enter your name.",
                minLength: "Name at least 2 characters",
                pattern: "Name should match the regex"
            }
        },
        submitHandler: function (form) {
            form.submit();
        }
    });
</script>


