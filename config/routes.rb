SchnellstEmmerAnmeldung::Application.routes.draw do
  root :to => "site#index"

  get   "/signin",    to: "site#signin"
  post  "/signin",    to: "site#signin_action"
  get   "/logout",    to: "site#logout"
  get   "/export",    to: "site#export"

  post  "/register",  to: "site#register"

  post  "/finalize",      to: "site#finalize"
  get   "/confirmation",  to: "site#confirmation"

  delete "/athletes/:athlete", to: "site#deregister"

end
