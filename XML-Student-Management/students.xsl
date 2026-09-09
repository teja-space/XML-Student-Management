<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">

        <html>
            <head>

                <title>Student Management System</title>

                <style>

                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                        background-color: #f4f4f4;
                    }

                    h1 {
                        text-align: center;
                    }

                    .count {
                        font-size: 18px;
                        margin-bottom: 10px;
                    }

                    input, select {
                        padding: 6px;
                        margin-right: 10px;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                        background-color: white;
                    }

                    th {
                        background-color: #333;
                        color: white;
                        padding: 10px;
                    }

                    td {
                        border: 1px solid #ccc;
                        padding: 8px;
                        text-align: center;
                    }

                    tr:hover {
                        background-color: #f1f1f1;
                    }

                </style>

                <script>
                    function filterStudents() {

                        var searchInput =
                            document.getElementById("search").value.toLowerCase();

                        var courseFilter =
                            document.getElementById("courseFilter").value;

                        var genderFilter =
                            document.getElementById("genderFilter").value;

                        var table =
                            document.getElementById("studentTable");

                        var rows =
                            table.getElementsByTagName("tr");

                        for (var i = 1; i &lt; rows.length; i++) {

                            var nameCell =
                                rows[i].getElementsByTagName("td")[2];

                            var genderCell =
                                rows[i].getElementsByTagName("td")[3];

                            var courseCell =
                                rows[i].getElementsByTagName("td")[6];

                            if (nameCell &amp;&amp; genderCell &amp;&amp; courseCell) {

                                var name =
                                    nameCell.textContent.toLowerCase();

                                var gender =
                                    genderCell.textContent;

                                var course =
                                    courseCell.textContent;

                                var nameMatch =
                                    name.indexOf(searchInput) &gt; -1;

                                var courseMatch =
                                    courseFilter === "All"
                                    || course === courseFilter;

                                var genderMatch =
                                    genderFilter === "All"
                                    || gender === genderFilter;

                                if (nameMatch &amp;&amp; courseMatch &amp;&amp; genderMatch) {
                                    rows[i].style.display = "";
                                } else {
                                    rows[i].style.display = "none";
                                }

                            }
                        }
                    }
                </script>

            </head>

            <body>

                <h1>Student Management System</h1>

                <div class="count">
                    <b>Total Students: </b>
                    <xsl:value-of select="count(students/student)"/>
                </div>

                <div class="count">
                    Computer Science:
                    <xsl:value-of select="count(students/student[course='Computer Science'])"/>
                </div>

                <div class="count">
                    Information Technology:
                    <xsl:value-of select="count(students/student[course='Information Technology'])"/>
                </div>

                <div class="count">
                    Computer Applications:
                    <xsl:value-of select="count(students/student[course='Computer Applications'])"/>
                </div>

                <div class="count">

                    <b>Search Student: </b>

                    <input
                        type="text"
                        id="search"
                        placeholder="Enter student name"
                        onkeyup="filterStudents()"/>

                    <b>Course: </b>

                    <select
                        id="courseFilter"
                        onchange="filterStudents()">

                        <option value="All">All Courses</option>

                        <option value="Computer Science">
                            Computer Science
                        </option>

                        <option value="Information Technology">
                            Information Technology
                        </option>

                        <option value="Computer Applications">
                            Computer Applications
                        </option>

                    </select>

                    <b>Gender: </b>

                    <select
                        id="genderFilter"
                        onchange="filterStudents()">

                        <option value="All">All</option>

                        <option value="Male">
                            Male
                        </option>

                        <option value="Female">
                            Female
                        </option>

                    </select>

                </div>

                <p><b>Student Report</b></p>

                <table id="studentTable">

                    <tr>
                        <th>ID</th>
                        <th>Rank</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Age</th>
                        <th>Date of Birth</th>
                        <th>Course</th>
                        <th>Department</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>Country</th>
                        <th>Status</th>
                        <th>Subjects &amp; Marks</th>
                        <th>Total</th>
                        <th>Average</th>
                        <th>Grade</th>
                        <th>Result</th>
                    </tr>

                    <xsl:for-each select="students/student">

                        <xsl:sort
                            select="sum(subjects/subject/marks) div count(subjects/subject)"
                            data-type="number"
                            order="descending"/>

                        <tr>

                            <td>
                                <xsl:value-of select="@id"/>
                            </td>

                            <td>
                                <xsl:value-of select="position()"/>
                            </td>

                            <td>
                                <xsl:value-of select="name"/>
                            </td>

                            <td>
                                <xsl:value-of select="gender"/>
                            </td>

                            <td>
                                <xsl:value-of select="age"/>
                            </td>

                            <td>
                                <xsl:value-of select="dateOfBirth"/>
                            </td>

                            <td>
                                <xsl:value-of select="course"/>
                            </td>

                            <td>
                                <xsl:value-of select="department"/>
                            </td>

                            <td>
                                <xsl:value-of select="email"/>
                            </td>

                            <td>
                                <xsl:value-of select="phone"/>
                            </td>

                            <td>
                                <xsl:value-of select="address/street"/>
                                <br/>
                                <xsl:value-of select="address/state"/>
                                <br/>
                                <xsl:value-of select="address/pincode"/>
                            </td>

                            <td>
                                <xsl:value-of select="address/city"/>
                            </td>

                            <td>
                                <xsl:value-of select="country"/>
                            </td>

                            <td>
                                <xsl:value-of select="@status"/>
                            </td>

                            <td>

                                <xsl:for-each select="subjects/subject">

                                    <div>
                                        <xsl:value-of select="name"/>
                                        -
                                        <xsl:value-of select="marks"/>
                                    </div>

                                </xsl:for-each>

                            </td>

                            <td>
                                <xsl:value-of select="sum(subjects/subject/marks)"/>
                            </td>

                            <td>
                                <xsl:value-of select="format-number(
                                    sum(subjects/subject/marks)
                                    div count(subjects/subject),
                                    '0.00'
                                )"/>
                            </td>

                            <td>

                                <xsl:choose>

                                    <xsl:when test="sum(subjects/subject/marks) div count(subjects/subject) &gt;= 90">
                                        A+
                                    </xsl:when>

                                    <xsl:when test="sum(subjects/subject/marks) div count(subjects/subject) &gt;= 80">
                                        A
                                    </xsl:when>

                                    <xsl:when test="sum(subjects/subject/marks) div count(subjects/subject) &gt;= 70">
                                        B
                                    </xsl:when>

                                    <xsl:when test="sum(subjects/subject/marks) div count(subjects/subject) &gt;= 60">
                                        C
                                    </xsl:when>

                                    <xsl:otherwise>
                                        F
                                    </xsl:otherwise>

                                </xsl:choose>

                            </td>

                            <td>

                                <xsl:choose>

                                    <xsl:when test="sum(subjects/subject/marks) div count(subjects/subject) &gt;= 40">
                                        PASS
                                    </xsl:when>

                                    <xsl:otherwise>
                                        FAIL
                                    </xsl:otherwise>

                                </xsl:choose>

                            </td>

                        </tr>

                    </xsl:for-each>

                </table>

            </body>

        </html>

    </xsl:template>

</xsl:stylesheet>