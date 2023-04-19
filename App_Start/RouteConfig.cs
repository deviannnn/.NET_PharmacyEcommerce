using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Pharmacy
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Home",
                url: "trang-chu",
                defaults: new { controller = "Home", action = "Index" },
                namespaces: new[] { "Pharmacy.Controllers" }
            );

            routes.MapRoute(
                name: "About",
                url: "thong-tin-nha-thuoc",
                defaults: new { controller = "About", action = "Index" },
                namespaces: new[] { "Pharmacy.Controllers" }
            );

            routes.MapRoute(
                name: "Contact",
                url: "lien-he",
                defaults: new { controller = "Contact", action = "Index" },
                namespaces: new[] { "Pharmacy.Controllers" }
            );

            routes.MapRoute(
                name: "ProductDefault",
                url: "san-pham",
                defaults: new { controller = "Product", action = "Index" },
                namespaces: new[] { "Pharmacy.Controllers" }
            );

            routes.MapRoute(
                name: "ProductByMeta",
                url: "{type}/{meta}",
                defaults: new { controller = "Product", action = "getByMeta", meta = UrlParameter.Optional },
                constraints: new RouteValueDictionary { { "type", "san-pham" } },
                namespaces: new[] { "Pharmacy.Controllers" }
            );

            routes.MapRoute(
                name: "ProductDetail",
                url: "{type}/{meta}/{id}",
                defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
                constraints: new RouteValueDictionary { { "type", "san-pham" } },
                namespaces: new[] { "Pharmacy.Controllers" }
            );

            routes.MapRoute(
                name: "NewsDefault",
                url: "tin-tuc",
                defaults: new { controller = "News", action = "Index" },
                namespaces: new[] { "Pharmacy.Controllers" }
            );

            routes.MapRoute(
                name: "NewsDetail",
                url: "{type}/{meta}",
                defaults: new { controller = "News", action = "Detail", meta = UrlParameter.Optional },
                constraints: new RouteValueDictionary { { "type", "tin-tuc" } },
                namespaces: new[] { "Pharmacy.Controllers" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Pharmacy.Controllers" }
            );

        }
    }
}
