<%@ Application Language="C#" %>
<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        System.Web.Routing.RouteTable.Routes.MapPageRoute(
           "contactus", "contactus", "~/Pages/contactus.aspx");
        //System.Web.Routing.RouteTable.Routes.MapPageRoute("default", "", "~/Default.aspx");
        System.Web.Routing.RouteTable.Routes.MapPageRoute(
            "room_post", "post", "~/Pages/Rooms/page_room_post.aspx");
        System.Web.Routing.RouteTable.Routes.MapPageRoute(
            "room_list", "list/all", "~/Pages/Rooms/page_room_listing.aspx");
        System.Web.Routing.RouteTable.Routes.MapPageRoute(
           "room_list_detail", "list2/{room_id}", "~/Pages/Rooms/page_room_listing.aspx");
        System.Web.Routing.RouteTable.Routes.MapPageRoute(
           "room_detail", "room/{room_id}", "~/Pages/Rooms/page_room_detail.aspx");
        System.Web.Routing.RouteTable.Routes.MapPageRoute(
            "room_bookmark", "bookmark", "~/Pages/Rooms/page_bookmark.aspx");
        System.Web.Routing.RouteTable.Routes.MapPageRoute(
            "room_map", "map/{postalcode}", "~/Pages/Rooms/page_google_map.aspx");


        #region Quote
        System.Web.Routing.RouteTable.Routes.MapPageRoute(
         "quote_listing", "quote", "~/Pages/Quotes/page_quote_listing.aspx");
        #endregion

        #region News
        System.Web.Routing.RouteTable.Routes.MapPageRoute("news_post", "news/post", "~/Pages/News/post.aspx");
        System.Web.Routing.RouteTable.Routes.MapPageRoute("news_detail", "news/{news_id}", "~/Pages/News/Detail.aspx");
        System.Web.Routing.RouteTable.Routes.MapPageRoute("news_list", "news/list/all", "~/Pages/News/list.aspx");
        System.Web.Routing.RouteTable.Routes.MapPageRoute("news_listtype", "news/type/{type_id}", "~/Pages/News/type.aspx");
        #endregion

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
