from rest_framework import serializers

from apps.models import Product, Category


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ("id",'name', 'price', 'category', 'description', 'created_at')


# class CategorySerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Category
#         fields = ('name',)
