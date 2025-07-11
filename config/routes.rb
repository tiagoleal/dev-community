Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  root "home#index"

  get "member/:id", to: "members#show", as: "member"
  get "edit_description/:id", to: "members#edit_description", as: "edit_member_description"
  patch "update_description/:id", to: "members#update_description", as: "update_member_description"

  get "edit_personal_details/:id", to: "members#edit_personal_details", as: "edit_member_personal_details"
  get "edit_profile_details/:id", to: "members#edit_profile_details", as: "edit_member_profile_details"
  patch "update_personal_details/:id", to: "members#update_personal_details", as: "update_member_personal_details"
  get "member-connections/:id", to: "members#connections", as: "member_connections"

  resources :work_experiences
  resources :connections
end
