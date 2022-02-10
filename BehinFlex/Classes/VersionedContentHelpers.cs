using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;

namespace BehinFlex.Classes.Helpers
{
    public static class VersionedContentHelpers
    {
        public static string VersionedContent(this UrlHelper urlHelper, string contentPath)
        {
            string versionedContent = urlHelper.Content(contentPath);

            string modified = File.GetLastWriteTime(HostingEnvironment.MapPath(contentPath))
                .ToString("yyyyMMddhhmmss");
            if (versionedContent.Contains('?'))
                versionedContent += "&" + modified;
            else
                versionedContent += "?" + modified;

            return versionedContent;
        }
    }
}

//This is a htmlHelper wich Links to css and js files and changes them in a way that date and time of relative file such as js or css file
//is inserted at the end of them.so if we change those files that load from this htmlhelper ,it dosent need to press ctrl+F5 to see changes in browser
//you can right click on one of pages that loads via htmlhelper and see how it look likes (example:ShowProductBybrand)