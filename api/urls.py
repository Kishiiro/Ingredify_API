from django.urls import re_path
from django.views.decorators.csrf import csrf_exempt

from api.views import generate_token
from api.views import navigation
from api.views import signup
from api.views import dashboard
from api.views import profile
from api.views import pantry
from api.views import mealplan
from api.views import community

app_name = 'api'

urlpatterns = [
    # Token related 
    re_path(r'^token/?$', generate_token.authenticate_user),
    re_path(r'^refresh_token/?$', generate_token.get_new_token),
    re_path(r'^verify_token/?$', generate_token.verify_token),
    re_path(r'^get-csrf-token/?$', csrf_exempt(generate_token.get_csrf_token), name='get-csrf-token'),

    #navigation related
    re_path(r'^navigation/?$', navigation.Transact.as_view({'post': 'navigation'})),

    #signup
    re_path(r'^signup/expert/?$', signup.Transact.as_view({'post': 'expert'})),
    re_path(r'^signup/cheffies/?$', signup.Transact.as_view({'post': 'cheffies'})),
    re_path(r'^signup/expert/verify?$', signup.Transact.as_view({'post': 'verify'})),


    #Profile
    re_path(r'^profile/user?$', profile.Transact.as_view({'post': 'ProfileUser'})),
    re_path(r'^profile/update/name?$', profile.Transact.as_view({'post': 'ProfileUpdateName'})),
    re_path(r'^profile/update/password?$', profile.Transact.as_view({'post': 'ProfileUpdatePassword'})),
    re_path(r'^profile/comorbidity?$', profile.Transact.as_view({'post': 'ProfileComorbidity'})),
    re_path(r'^profile/restrictions?$', profile.Transact.as_view({'post': 'ProfileRestrictions'})),
    
    #dashboard
    re_path(r'^dashboard/?$', dashboard.Transact.as_view({'post': 'AllRecipe'})),
    re_path(r'^dashboard/user?$', dashboard.Transact.as_view({'post': 'ProfileUser'})),
    re_path(r'^dashboard/recipe?$', dashboard.Transact.as_view({'post': 'SearchRecipe'})),

    #pantry
    re_path(r'^pantry/ingredients?$', pantry.Transact.as_view({'post': 'SearchIngredients'})),
    re_path(r'^pantry/recipe?$', pantry.Transact.as_view({'post': 'SearchMeal'})),
    re_path(r'^pantry/create?$', pantry.Transact.as_view({'post': 'CreateMeal'})),

    #mealplan
    re_path(r'^mealplan/?$', mealplan.Transact.as_view({'post': 'MealPlan'})),
    re_path(r'^mealplan/recipe?$', mealplan.Transact.as_view({'post': 'SearchMeal'})),
    re_path(r'^mealplan/add?$', mealplan.Transact.as_view({'post': 'AddMealPlan'})),

    #community
    re_path(r'^community/recipe?$', community.Transact.as_view({'post': 'SearchMeal'})),

    #dashboard view
    re_path(r'^dashboard/recipe?$', dashboard.Transact.as_view({'post': 'recipe'})),

    #profile related
    re_path(r'^profile/upload_photo/?$', profile.Transact.as_view({'post': 'upload_photo'})),    
]
