from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from apps.views import PostDetail, PostList

urlpatterns = [
    path("apps/", PostList.as_view()),
    path("apps/<int:pk>/", PostDetail.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)
