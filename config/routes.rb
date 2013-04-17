SchnellstEmmerAnmeldung::Application.routes.draw do
  root :to => "site#index"

  get   "/signin",    to: "site#signin"
  post  "/signin",    to: "site#signin_action"

  post  "/register",  to: "site#register"

  delete "/athletes/:athlete", to: "site#deregister"

end
