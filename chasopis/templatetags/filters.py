from django import template
from database.select import get_name_user

register = template.Library()


@register.filter
def get_name_by_id(value):
    return get_name_user(value)


@register.simple_tag()
def debug_object_dump(var):
    return vars(var)
