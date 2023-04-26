from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from apps.views import CategoryDetail, CategoryList, ProductList, ProductDetail

urlpatterns = [
    path("product/", ProductList.as_view()),
    path("product/<int:pk>/", ProductDetail.as_view()),
    path("category/", CategoryList.as_view()),
    path("category/<int:pk>/", CategoryDetail.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)
