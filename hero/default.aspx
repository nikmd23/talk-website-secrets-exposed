<%@ language="C#" Debug="true" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%
    string connstring = ConfigurationManager.ConnectionStrings["DataContext"].ConnectionString;
    string mascot = "";
    if (Request.HttpMethod == "GET"){
%>

<fieldset>
    <legend>Set MascotMania Winner & Home Page Hero</legend>
    <form method="POST">
        <select name="mascotid">
<%
    using (var connection = new SqlConnection(connstring)) 
    {
        connection.Open();
        var command = new SqlCommand("SELECT Id, Name FROM Mascots WHERE IsHero = 0 ORDER BY Name", connection);
        var reader = command.ExecuteReader();

        while (reader.Read())
        {
            Response.Write("<option value='" + reader[0] + "'>" + reader[1] + "</option>");
        }
        reader.Close();
    }
%>
            </select>
        <input type="submit" value="Submit" />
    </form>
</fieldset>

<%
    } 
    else if (Request.HttpMethod == "POST") 
    {
        using (var connection = new SqlConnection(connstring))
        {
            connection.Open();
            var updatecommand = new SqlCommand("UPDATE Mascots SET IsHero = 0; UPDATE Mascots SET IsHero = 1 WHERE Id = " + Request.Form["mascotid"], connection);
            updatecommand.ExecuteNonQuery();

            var command = new SqlCommand("SELECT Name FROM Mascots WHERE IsHero = 1", connection);
            mascot = (string)command.ExecuteScalar();
        }
%>
 
<h1>Hero Updated!</h1>
<em>Set to <%=mascot %> at <%=DateTime.Now.ToLongTimeString() %></em>
<hr />
<a href="/hero/">Update Again</a>

<%
    }
%>