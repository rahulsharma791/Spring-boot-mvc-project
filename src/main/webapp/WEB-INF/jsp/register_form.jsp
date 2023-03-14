<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>htmalForm</title>
  <link href="/css/registration.css" rel="stylesheet" type="text/css">
  <link rel = "icon" href =
          "https://cdn.vectorstock.com/i/1000x1000/62/68/india-flag-round-shape-vector-45046268.webp"
        type = "image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Amita&family=Gloock&family=Noto+Sans:wght@100&family=Tillana:wght@700&display=swap" rel="stylesheet">
</head>
<body>
<div style="background-color: burlywood">
  <table>
    <tr style="background-color: bisque">
      <td>
        <img class="logo" src="https://www.logopeople.in/blog/wp-content/uploads/2013/01/government-of-india.jpg">
      </td>
      <td>
        <table>
          <tr>
            <td class="topHeading"><b>Government of India</b></td>
          </tr>
          <tr>
            <td>
              <p1>A National Portal Of India</p1>
              <a class="readMore" href="https://www.google.com/">Read More</a>
            </td>
          </tr>
        </table>

      </td>

    </tr>
  </table>

    <div class="heading" id="heading">
        <table style="background-color: white">
            <tr style="background-color: bisque">
                <td>
                    <button onclick="history.back()" style="border: none;background-color: bisque">Go Back</button>
                </td>
                <td style="column-width: 1176px"><b>Welcome to Student Registration form</b></td>
            </tr>
            <tr>
                <marquee style="font-family: 'Gloock', serif;font-size: 12px;color: red">
                    These instructions pertain to online application for admission to Std 1 in Kendriya Vidyalayas for the academic year 2023-2024. In the remainder of these instructions, a "Vidyalaya" means a Kendriya Vidyalaya
                </marquee>
            </tr>
        </table>

    </div>
</div>
<%--@elvariable id="student" type=""--%>
<form:form action="register" onsubmit="return validate()" method="POST" enctype="multipart/form-data">
  <table>
    <tr>
      <td>
        <table>
          <tr>
            <td>
              First Name:
            </td>
            <td>
              <input type="text" placeholder="Enter Your First Name" name="firstName" id="firstName">
                <div><span class="errorMsg" id="firstNameError"></span></div>

            </td>
            <td>
              Last Name:
            </td>
            <td>
              <input type="text" placeholder="Enter Your Last Name" name="lastName" id="lastName">
                <div><span class="errorMsg" id="lastNameError"></span></div>
            </td>
          </tr>

          <tr>
            <td>
              Father Name:
            </td>
            <td>
              <input type="text" placeholder="Enter Your Father Name" name="fatherName" id="fatherName">
                <div><span class="errorMsg" id="fatherNameError"></span></div>
            </td>
          </tr>

          <tr>
            <td>
              Mother Name:
            </td>
            <td>
              <input type="text" placeholder="Enter Your Mother Name" name="motherName" id="motherName">
                <div><span class="errorMsg" id="motherNameError"></span></div>
            </td>
          </tr>

          <tr>
            <td>
              Email:
            </td>
            <td>
              <input type="text" placeholder="Enter Your Email" name="email" id="email">
                <div><span class="errorMsg" id="emailError"></span></div>
            </td>
            <td>
              Gender:
            </td>
            <td>
              <input type="radio" name="gender" value="male" checked>Male
              <input type="radio" name="gender" value="female">Female
            </td>
          </tr>
            <tr>
                <td>
                    Mobile Number:
                </td>
                <td>
                    <span>+91-</span>
                    <input type="tel" name="mobileNo" id="mobileNo" placeholder="7867******">
                    <div><span class="errorMsg" id="numberError"></span></div>
                </td>
            </tr>

          <tr>
            <td>
              Qualification:
            </td>
            <td>
              <select name="qualification">
                <option value="B.Tech" name="qualification">B.Tech</option>
              </select>
            </td>
            <td>
              Roll Number:
            </td>
            <td>
              <input type="text" placeholder="13ere45.." name="rollNo" id="rollNo">
                <div><span class="errorMsg" id="rollNoError"></span></div>
            </td>
          </tr>

          <tr>
            <td>
              Date of Birth:
            </td>
            <td>
                <input type=date id= dateOfBirth name="dateOfBirth">
                <div><span class="errorMsg" id="DOBError"></span></div>
            </td>
            <td>
              Marital Status:
            </td>
            <td>
              <select name="maritalStatus" id="marital_status">
                <option value="">-Select Marital Status-</option>
                <option value="Single" selected>Single</option>
                <option value="Married">Married</option>
                <option value="Widowed">Widowed</option>
                <option value="Separated">Separated</option>
                <option value="Divorced">Divorced</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>
              Address:
            </td>
            <td>
              <div>
                  <table>
                      <tr>
                          <td>
                              Plot Number:
                          </td>
                          <td>
                              <input type="text" name="plotNo" id="plotNo" placeholder="Enter Your plot number">
                              <div><span class="errorMsg" id="plotNoError"></span></div>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              City:
                          </td>
                          <td>
                              <input type="text" name="city" id="city" placeholder="Enter Your city">
                              <div><span class="errorMsg" id="cityError"></span></div>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              District:
                          </td>
                          <td>
                              <input type="text" name="district" id="district" placeholder="Enter Your District">
                              <div><span class="errorMsg" id="districtError"></span></div>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              State:
                          </td>
                          <td>
                              <input type="text" name="state" id="state" placeholder="Enter Your state">
                              <div><span class="errorMsg" id="stateError"></span></div>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              Pin Code:
                          </td>
                          <td>
                              <input type="text" name="pinCode" id="pinCode" placeholder="Enter Your Pin Code">
                              <div><span class="errorMsg" id="pinCodeError"></span></div>
                          </td>
                      </tr>
                      <tr>

                      </tr>
                  </table>

              </div>
            </td>
          </tr>

        </table>

      </td>
    </tr>

    <tr>
      <td><h3 style="font-size: 12px">Photo & Signature</h3></td>
    </tr>
    <tr>
      <td>
      <table id="fileTable">
        <tr>
          <td>
            Photo:
          </td>
          <td>
            <input type="file" name="studentPhoto" id="studentPhoto" accept="image/*" onchange="loadFile1(event)">
              <div><span class="errorMsg" id="studentPhotoError"></span></div>
          </td>
        </tr>
        <tr>
          <td>
            Signature:
          </td>
          <td>
            <input type="file" name="studentSignature" id="studentSignature" accept="image/*" onchange="loadFile(event)">
              <div><span class="errorMsg" id="studentSignatureError"></span></div>
          </td>
        </tr>

      </table>
      </td>
      <td>
        <div class="container">
          <img id="output" src="http://placehold.it/180" alt="your photo"/>
          <img id="output1" src="http://placehold.it/180" alt="your signature"/>
        </div>
      </td>
    </tr>
  </table>
  <br>
  <div class="button">
    <button id="submit" type="submit" value="Submit"/>
      Submit
    </button>
    <button type="reset" value="Reset">
      Reset
    </button>
  </div>
</form:form>
</body>
</html>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script type="text/javascript" src="/js/registration.js"></script>



