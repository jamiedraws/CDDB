using CDDB.Models;

namespace CDDB.Navigation
{
    public class Sitemap
    {
        public NavigationList SitemapList;
        public Sitemap()
        {
            SitemapList = new NavigationList();

            // Home
            SitemapList.AddItem(new NavigationItem
            {
                Id = "home",
                Name = "Home",
                Page = "Index",
                Hash = "#main"
            });

            // FAQ
            SitemapList.AddItem(new NavigationItem
            {
                Id = "faq",
                Name = "FAQ's",
                Page = "FAQ",
                Hash = "#main"
            });

            // Products
            SitemapList.AddItem(new NavigationItem
            {
                Id = "products",
                Name = "Products",
                Page = "Index",
                Hash = "#products",
                ApplyHash = true
            });

            // Deep Teal
            SitemapList.AddItem(new NavigationItem
            {
                Id = "deep-teal",
                Name = "Deep Teal",
                Page = "Index",
                Hash = "#deep-teal",
                ApplyHash = true
            });

            // Rose Quartz
            SitemapList.AddItem(new NavigationItem
            {
                Id = "rose-quartz",
                Name = "Rose Quartz",
                Page = "Index",
                Hash = "#rose-quartz",
                ApplyHash = true
            });

            // Wild Violet
            SitemapList.AddItem(new NavigationItem
            {
                Id = "wild-violet",
                Name = "Wild Violet",
                Page = "Index",
                Hash = "#wild-violet",
                ApplyHash = true
            });

            // Stardust Shimmer
            SitemapList.AddItem(new NavigationItem
            {
                Id = "stardust-shimmer",
                Name = "Stardust Shimmer",
                Page = "Index",
                Hash = "#stardust-shimmer",
                ApplyHash = true
            });

            // Bundles
            SitemapList.AddItem(new NavigationItem
            {
                Id = "bundles",
                Name = "Bundles",
                Page = "Index",
                Hash = "#bundles",
                ApplyHash = true
            });

            // Instructions
            SitemapList.AddItem(new NavigationItem
            {
                Id = "instructions",
                Name = "Full Instructions",
                Page = "Instructions",
                Hash = "#main"
            });

            // Contact Us
            SitemapList.AddItem(new NavigationItem
            {
                Id = "contact-us",
                Name = "Contact Us",
                Page = "https://www.batistehair.com/contact-us",
                IsExternal = true
            });

            // Shipping and Return Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "shipping-return-policy",
                Name = "Shipping and Return Policy",
                Page = "ShippingReturnPolicy",
                Hash = "#main"
            });

            // Privacy Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "privacy-policy",
                Name = "Privacy Policy",
                Page = "https://churchdwight.com/privacy-policy.aspx",
                IsExternal = true
            });

            // Terms & Conditions
            SitemapList.AddItem(new NavigationItem
            {
                Id = "terms",
                Name = "Terms and Conditions",
                Page = "Terms",
                Hash = "#main"
            });

            // Influencers
            SitemapList.AddItem(new NavigationItem
            {
                Id = "influencers",
                Name = "Videos",
                Page = "Influencers",
                Hash = "#main"
            });

            // Order Now
            SitemapList.AddItem(new NavigationItem
            {
                Id = "order-now",
                Name = "Shop",
                Page = "OrderNow",
                Hash = "#main"
            });

            // Instagram
            SitemapList.AddItem(new NavigationItem
            {
                Id = "instagram",
                Name = "Instagram",
                Page = "https://www.instagram.com/batiste_us/",
                IsExternal = true
            });

            // Facebook
            SitemapList.AddItem(new NavigationItem
            {
                Id = "facebook",
                Name = "Facebook",
                Page = "https://www.facebook.com/batisteus/?brand_redir=95597922197",
                IsExternal = true
            });

            // YouTube
            SitemapList.AddItem(new NavigationItem
            {
                Id = "youtube",
                Name = "YouTube",
                Page = "https://www.youtube.com/user/batistehair",
                IsExternal = true
            });
        }
    }
}