﻿using Microsoft.Owin;
using Owin;
using System;
using System.Threading.Tasks;

namespace OAuthSecurity
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=316888
        }
    }
}
