Imports System.data.SqlClient
Imports System.Data
Imports Newtonsoft.Json
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strLat As String = "37.788022" 'Request.QueryString("lat")
        Dim strLong As String = "-122.399797" 'Request.QueryString("lon")
        ' Dim strUserID As String = Request.QueryString("User_ID")
        Dim strType As String = "bars" 'Request.QueryString("Cat")


        GetStuffFromYelpByLocation(strLat, strLong, strType)
    End Sub

    Private Sub GetStuffFromYelpByLocation(ByVal strLat As String, ByVal strLong As String, ByVal strCat As String)
        Dim strBuild As New System.Text.StringBuilder

        Dim strAPI As String = String.Format("http://api.yelp.com/business_review_search?&lat={0}&long={1}&ywsid=5HBZoYQmr9IyupTpPtoH9g&category={2}", strLat, strLong, strCat)

        Dim objClient As New System.Net.WebClient
        Dim strReturn As String = objClient.DownloadString(strAPI)

        Dim objJSON As Linq.JObject = Linq.JObject.Parse(strReturn)

        For Each objProp As Linq.JProperty In objJSON.Properties
            strBuild.Append(objProp.Name.ToString().Replace("""", "") & ":" & objProp.Value.ToString & vbCrLf)
        Next

        Response.Write(strBuild.ToString)
    End Sub

End Class
