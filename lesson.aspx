<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lesson.aspx.cs" Inherits="_lesson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title></title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
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
        <div class="container-fluid bodyApp">
            <asp:Panel ID="coursImage" runat="server"></asp:Panel>
            <asp:Label CssClass="row" ID="lessonName" runat="server" Text=""></asp:Label>
            <asp:Label ID="authorName" runat="server" Text=""></asp:Label>
            <audio id="audioPod" controls="controls" style="display:none" runat="server">
                <source id="podSource"  type="audio/mpeg" runat="server"/>
            </audio>
            <div class="row progressBar">
                <div id="progressBackground" onclick="seekNext(event)"></div>
                <div class="progress" id="progress" onclick="seekNext(event)"></div>
            </div>
            <asp:Label CssClas="row" ID="timeLabel" runat="server" Text="Label"></asp:Label>
            <div class="row audioBarBtns">
                <div class="col-4" id="cell4btn">
                    <div id="nextBtn" onclick="next10Sec()"></div>
                </div>
                <div class="col-4" id="cell4btn">
                    <div class="playBtn" id="playPauseBtn" onclick="playPauseAudio()"></div>
                </div>
                <div class="col-4" id="cell4btn">
                    <div id="replayBtn" onclick="replay10Sec()"></div>
                </div>
            </div>
        </div>
        
    </div>
    </form>
</body>
</html>
