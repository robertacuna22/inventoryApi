using IMS.Business.Services.Channel;
using IMS.Domain.BusinessContract;
using IMS.Repository.Contract;
using IMS.Repository.Repository;
using System.Web.Http;
using Unity;
using Unity.WebApi;

namespace IMS
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // e.g. container.RegisterType<ITestService, TestService>();
            //repositories
            container.RegisterType<IDapperConnection, AppDatabaseConnection>();
            container.RegisterType<IBrandsRepository, BrandsRepository>();
            container.RegisterType<ICategoryRepository, CategoryRepository>();
            container.RegisterType<IUnitOfMeasuresRepository,UnitOfMeasuresRepository>();

            //services 
            container.RegisterType<IBrandsServices, BrandsServices>();
            container.RegisterType<ICategoryServices, CategoryServices>();
            container.RegisterType<IUnitOfMeasureServices, UnitOfMeasureServices>();

            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}