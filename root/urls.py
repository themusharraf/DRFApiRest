from django.contrib import admin
from django.urls import path, include
from root.settings import STATIC_ROOT, STATIC_URL
from django.conf.urls.static import static

urlpatterns = [
                  path('admin/', admin.site.urls),
                  path("", include("apps.urls"))
              ] + static(STATIC_URL, document_root=STATIC_ROOT)
