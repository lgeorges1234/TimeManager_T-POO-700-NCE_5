defmodule TimeManagerWeb.Router do
  use TimeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end


  scope "/api", TimeManagerWeb do
    pipe_through :api

    # User routes
    get "/users", UserController, :index            # URL: /api/users (Liste des utilisateurs)
    get "/users/:id", UserController, :show         # URL: /api/users/:id (Afficher un utilisateur spécifique)
    post "/users", UserController, :create          # URL: /api/users (Créer un nouvel utilisateur)
    put "/users/:id", UserController, :update       # URL: /api/users/:id (Mettre à jour un utilisateur spécifique)
    delete "/users/:id", UserController, :delete    # URL: /api/users/:id (Supprimer un utilisateur spécifique)

    # Working Time routes
    get "/workingtimes", WorkingTimeController, :index
    get "/workingtimes/:user_id", WorkingTimeController, :index      # URL: /api/workingtime/:user_id (Lister les heures de travail d'un utilisateur)
    get "/workingtimes/:user_id/:id", WorkingTimeController, :show   # URL: /api/workingtime/:user_id/:id (Afficher une heure de travail spécifique)
    post "/workingtimes/:user_id", WorkingTimeController, :create    # URL: /api/workingtime/:user_id (Créer une heure de travail pour un utilisateur)
    put "/workingtimes/:id", WorkingTimeController, :update          # URL: /api/workingtime/:id (Mettre à jour une heure de travail spécifique)
    delete "/workingtimes/:id", WorkingTimeController, :delete       # URL: /api/workingtime/:id (Supprimer une heure de travail spécifique)

    # Clocking routes
    get "/clocks", ClockController, :index              # GET all clocks
    get "/clocks/:user_id", ClockController, :index     # URL: /api/clocks/:user_id (Lister les pointages d'un utilisateur)
    post "/clocks/:user_id", ClockController, :create   # URL: /api/clocks/:user_id (Créer un pointage pour un utilisateur)
  end
  
end
