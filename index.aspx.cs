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

public partial class _index : System.Web.UI.Page
{
    XmlDocument myDoc = new XmlDocument();
    string courseID = "1"; //for the course id session
    protected void Page_Load(object sender, EventArgs e)
    {
        myDoc.Load(Server.MapPath("myTrees/myTree.xml"));

        XmlNodeList courseTitle;
        courseTitle = myDoc.SelectNodes("/courses/course[@id='" + courseID + "']/title");

        XmlNodeList courseDesc;
        courseDesc = myDoc.SelectNodes("/courses/course[@id='" + courseID + "']/description");

        XmlNodeList courseAuthor;
        courseAuthor = myDoc.SelectNodes("/courses/course[@id='" + courseID + "']/author");

        foreach (XmlNode a in courseTitle)
        {
            courseTitleLbl.Text = a.InnerXml.ToString();
        }

        foreach (XmlNode a in courseDesc)
        {
            courseDescriptionLbl.Text = a.InnerXml.ToString();
        }

        foreach (XmlNode a in courseAuthor)
        {
            courseAuthorLbl.Text = a.InnerXml.ToString();
        }
    }
    protected void Page_init(object sender, EventArgs e)
    {
        
    }




    protected void courseBtn_Click(object sender, EventArgs e)
    {
        Button z = (Button)sender;
        Session["lessonId"] = z.Attributes["lessonId"];
        Response.Redirect("lesson.aspx");
        
    }
}