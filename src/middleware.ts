import { defineMiddleware } from "astro:middleware";

export const onRequest = defineMiddleware((context, next) => {
  const { url, cookies, redirect } = context;
  
  // Allow access to login page and public assets
  if (
    url.pathname.startsWith('/login') ||
    url.pathname.startsWith('/_astro') ||
    url.pathname.startsWith('/favicon')
  ) {
    return next();
  }

  const session = cookies.get("admin_session");
  
  if (!session) {
    return redirect('/login');
  }

  return next();
});
