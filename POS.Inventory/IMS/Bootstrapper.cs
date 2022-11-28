using IMS.Business.Services.Channel;
using IMS.Domain.BusinessContract;
using IMS.Repository.Contract;
using IMS.Repository.Repository;
using System.Web.Mvc;
using Unity;
using Microsoft.Practices.Unity;
using Unity.Mvc4;

namespace IMS
{
  public static class Bootstrapper
  {
    public static Microsoft.Practices.Unity.IUnityContainer Initialise()
    {
      var container = BuildUnityContainer();


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



            DependencyResolver.SetResolver(new UnityDependencyResolver(container));

            return container;
    }

    private static Microsoft.Practices.Unity.IUnityContainer BuildUnityContainer()
    {
      var container = new Microsoft.Practices.Unity.UnityContainer();

      // register all your components with the container here
      // it is NOT necessary to register your controllers

      // e.g. container.RegisterType<ITestService, TestService>();    
      RegisterTypes(container);

      return container;
    }

    public static void RegisterTypes(Microsoft.Practices.Unity.IUnityContainer container)
    {
    
    }
  }
}