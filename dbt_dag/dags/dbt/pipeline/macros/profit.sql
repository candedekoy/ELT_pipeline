
    {% macro calculate_profit(total_sales, quantity, supply_cost) %}
        ({{ total_sales }} - ({{ quantity }} * {{ supply_cost }})) 
    {% endmacro %}
