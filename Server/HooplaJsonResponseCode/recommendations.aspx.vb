Imports System.data.SqlClient
Imports System.Data
Imports Newtonsoft.Json


Partial Class recommendations
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim objDataTable As New DataTable

        'Dim objColumn As New DataColumn
        'objColumn.ColumnName = "Uno"
        'objDataTable.Columns.Add(objColumn)

        'objColumn = New DataColumn
        'objColumn.ColumnName = "due"
        'objDataTable.Columns.Add(objColumn)

        'Dim objRow As DataRow
        'objRow = objDataTable.NewRow

        'objRow.Item(0) = "Prop1"
        'objRow.Item(1) = "Val1"
        'objDataTable.Rows.Add(objRow)

        Dim strLat As String = "37.788022" 'Request.QueryString("lat")
        Dim strLong As String = "-122.399797" 'Request.QueryString("lon")
        ' Dim strUserID As String = Request.QueryString("User_ID")
        Dim strType As String = "bars" 'Request.QueryString("Cat")


        GetStuffFromYelpByLocation(strLat, strLong, strType)

        '  Response.Write(GenerateAspNetJsonString(objDataTable))
        ' Response.Write(GetStringFromYelp("http://api.yelp.com/business_review_search?&location=650%20Mission%20St%2ASan%20Francisco%2A%20CA&ywsid=5HBZoYQmr9IyupTpPtoH9g&category=bars"))



    End Sub
    Private Function GenerateAspNetJsonString(ByVal objDataTable As DataTable) As String
        Dim strBuild As New System.Text.StringBuilder
        strBuild.Append("{")

        For Each objRow As DataRow In objDataTable.Rows
            strBuild.Append(objRow.Item(0).ToString & ":" & objRow.Item(1).ToString)
        Next
        strBuild.Append("}")

        Return strBuild.ToString

    End Function


    Private Sub GetStuffFromYelpByLocation(ByVal strLat As String, ByVal strLong As String, ByVal strCat As String)

        Dim strBuild As New System.Text.StringBuilder

        Dim strAPI As String = String.Format("http://api.yelp.com/business_review_search?&lat={0}&long={1}&ywsid=5HBZoYQmr9IyupTpPtoH9g&category={2}", strLat, strLong, strCat)

        Dim objClient As New System.Net.WebClient
        Dim strReturn As String = objClient.DownloadString(strAPI)

        Dim objJSON As Linq.JObject = Linq.JObject.Parse(objClient.DownloadString(strAPI))

        For Each objProp As Linq.JProperty In objJSON.Properties
            strBuild.Append(objProp.Name.ToString().Replace("""", "") & ":" & objProp.Value.ToString & vbCrLf)
        Next

        Response.Write(strBuild.ToString)

    End Sub

    Private Sub GetBusinessByLatLong(ByVal Lat1 As Double, ByVal Lon1 As Double)


        'SET @Lat1 = 55.00350
        'SET @Lon1 = -119.76763
        'SET @Radius = 6378.1

        'declare @CC decimal(9,5),@cs decimal(9,5),@rlat decimal(9,5)

        'Select @CC=cos(RADIANS(@Lat1))*cos(RADIANS(@Lon1))
        '         .@CS=cos(RADIANS(@Lat1))*sin(RADIANS(@Lon1))
        '         ,@slat=Sin(radians(@lat1))

        'SELECT ROLL,MTDESC,LATITUDE,LONGITUDE
        'FROM (select roll,mtdesc,latitude,longitude
        '                   ,convert(decimal(9,5),radians(latitude)) as Rlat
        '                   ,convert(decimal(9,5),radians(longitude)) as Rlong
        '            from MAP_POINTS
        '         ) as x
        'WHERE (
        '      acos(
        '            @cc*(cos(rlat)*cos(RLONG) )
        '       +   @cs*(cos(RLAT)*sin(RLONG) )
        '       +   @SLat*sin(RLAT)
        '      ) * @Radius
        ') < 10

    End Sub
    Private Sub PopulateResources(ByRef MainNode As DataTable)

        Dim cnSQL As SqlConnection
        Dim cmSQL As SqlCommand
        Dim drSQL As SqlDataAdapter
        Dim strSQL As String

        Try
            'strSQL = String.Format("SELECT ID, iif(ParentID > 0, ParentID, 0) as ParID, ResourceName FROM tblResources WHERE (LocationID = {0}) " & _
            '                       "ORDER BY ParentID, ResourceName", CType(cboLocation.Items(cboLocation.SelectedIndex), ListItem).ID)

            'cnSQL = New SqlConnection(m_DBConnection)
            cnSQL.Open()
            cmSQL = New SqlCommand(strSQL, cnSQL)
            drSQL = New SqlDataAdapter(cmSQL)
            drSQL.Fill(MainNode)

        Catch ex As SqlException
            MsgBox(ex.Message, MsgBoxStyle.Critical, "PopulateResources SQL Error")

        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical, "PopulateResources General Error")
        Finally
            If Not IsNothing(drSQL) Then
                drSQL.Dispose()
            End If
            drSQL.Dispose()
            cnSQL.Close()
            cnSQL.Dispose()
        End Try

    End Sub
    Private Function GetStringFromYelp(ByVal strAPI As String) As String
        Dim objClient As New System.Net.WebClient
        Return objClient.DownloadString(strAPI)
    End Function
End Class
