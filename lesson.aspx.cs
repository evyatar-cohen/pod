using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.IO;
using System.Drawing;

public partial class _lesson : System.Web.UI.Page
{
    
   
    XmlDocument myDoc = new XmlDocument();
   
    protected void Page_init(object sender, EventArgs e)
    {
        string courseID = "1"; //for the course id session
        string lessonId = Session["lessonId"].ToString();
        myDoc.Load(Server.MapPath("myTrees/myTree.xml"));


        XmlNodeList title;
        title = myDoc.SelectNodes("/courses/course[@id='" + courseID + "']/lessons/lesson[@id='"+ lessonId+"']/title");

        XmlNodeList author;
        author = myDoc.SelectNodes("/courses/course[@id='" + courseID + "']/author");

        XmlNodeList duration;
        duration = myDoc.SelectNodes("/courses/course[@id='" + courseID + "']/lessons/lesson[@id='" + lessonId + "']/audio/@duration");

        XmlNodeList logo;
        logo = myDoc.SelectNodes("/courses/course[@id='" + courseID + "']/logo");


        XmlNodeList audio;
        audio = myDoc.SelectNodes("/courses/course[@id='" + courseID + "']/lessons/lesson[@id='" + lessonId + "']/audio");




        foreach (XmlNode a in title)
        {
            lessonName.Text = a.InnerXml.ToString();
        }

        foreach (XmlNode a in author)
        {
            authorName.Text = a.InnerXml.ToString();
        }

        foreach (XmlNode a in duration)
        {

            timeLabel.Text = a.InnerXml.ToString();
        }

        string logoString = "";
        foreach (XmlNode a in logo)
        {

            logoString = a.InnerXml.ToString();
        }
        coursImage.Style["background-image"] = "../Logos/" + logoString;

        string audioString = "";
        foreach (XmlNode a in audio)
        {

            audioString = a.InnerXml.ToString();
        }
        podSource.Attributes.Add("src", "Podcasts/" + audioString + ".mp3");


    }
    protected void Page_Load(object sender, EventArgs e)
    {


       




    }

}