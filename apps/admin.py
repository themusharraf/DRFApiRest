from django.contrib import admin
from import_export.admin import ImportExportModelAdmin
from apps.models import Product, Category


class ProductStackedInline(admin.StackedInline):
    model = Product
    min_num = 0
    extra = 2
    max_num = 2


@admin.register(Category)
class CategoryAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    list_display = ('name',)
    inlines = (ProductStackedInline,)


@admin.register(Product)
class ProductAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    list_display = ('name', 'price', 'category', 'description')
    exclude = ("slug",)

    def get_queryset(self, request):
        if request.user.is_superuser:
            return super().get_queryset(request)
        data = super().get_queryset(request).filter(author=request.user)
        return data

    def save_model(self, request, obj, form, change):
        obj.author = request.user
        super().save_model(request, obj, form, change)
