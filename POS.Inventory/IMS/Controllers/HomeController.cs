﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            string cs = ConfigurationManager.ConnectionStrings["IMS"].ConnectionString;
            ViewBag.Title = "Home Page";

            return View();
        }
    }
}
