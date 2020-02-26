<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title></title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <script src="jScripts/jquery-2.1.1.min.js"></script>
    <link href="bootstrap/css/bootstrap-reboot.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-grid.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="phonegap.js" type="text/javascript"></script>
    <script src="cordova.js" type="text/javascript"></script>
    <script src="jScripts/JavaScript.js" type="text/javascript"></script>
    <link href="Styles/reset.css" rel="stylesheet" type="text/css" />
    <link href="Styles/myStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid bodyApp">
            <div class="container" id="courseInfo">
                <asp:Label CssClass="row" ID="courseTitleLbl" runat="server" Text="Label"></asp:Label>
                <asp:Label CssClass="row" ID="courseDescriptionLbl" runat="server" Text="Label"></asp:Label>
                <asp:Label CssClass="row" ID="courseAuthorLbl" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="container" id="courseLessons">
                <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/myTrees/myTree.xml" XPath="/courses/course/lessons/lesson"></asp:XmlDataSource>
                <asp:Repeater ID="rptEmpName" runat="server" DataSourceID="XmlDataSource1">
                    <HeaderTemplate>
                        <ol class="nameList">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="row" runat="server">
                            <div class="col-9" id="TitleAndDesc">
                                <asp:Label CssClass="row lessonTitle" ID="lessonTitle" runat="server" Text='<%#XPathBinder.Eval(Container.DataItem, "title")%>'> </asp:Label>
                                <asp:Label CssClass="row" ID="lessonDesc" runat="server" Text='<%#XPathBinder.Eval(Container.DataItem, "description")%>'> </asp:Label>
                              
                                
                            </div>
                              <asp:Panel CssClas="col-3" ID="lessonPlayIcon" runat="server" style="background: Red; height: 100%; width: 60px; margin:0 auto;"></asp:Panel>
                            <asp:Button CssClass="courseBtn" ID="courseBtn" runat="server" Text="Button" Visible="True" Width="100%" lessonId='<%#XPathBinder.Eval(Container.DataItem,"@id")%>' OnClick="courseBtn_Click"  />
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        <ol />
                    </FooterTemplate>
                </asp:Repeater>
            </div>


        </div>
    </form>
</body>
</html>
