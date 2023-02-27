using IMS.Business.Services.Channel;
using IMS.Domain.BusinessContract;
using IMS.Repository.Contract;
using IMS.Repository;
using System.Web.Http;
using Unity;
using Unity.WebApi;

namespace ISMgmt.Main
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // e.g. container.RegisterType<ITestService, TestService>();

            container.RegisterType<IDapperConnection, AppDatabaseConnection>();
            container.RegisterType<IBrandsRepository, BrandsRepository>();
            container.RegisterType<ICategoryRepository, CategoryRepository>();
            container.RegisterType<IUnitOfMeasuresRepository, UnitOfMeasuresRepository>();
            container.RegisterType<IProductsRepository, ProductsRepository>();
            container.RegisterType<ILogsRepository, LogsRepository>();

            //services 
            container.RegisterType<IBrandsServices, BrandsServices>();
            container.RegisterType<ICategoryServices, CategoryServices>();
            container.RegisterType<IUnitOfMeasureServices, UnitOfMeasureServices>();
            container.RegisterType<IProductsServices, ProductsServices>();
            container.RegisterType<ILogsServices, LogsServices>();


            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}