def get_value_from_nested_object(obj, keys):
    for key in keys:
        if isinstance(obj, dict) and key in obj:
            obj = obj[key]
        else:
            return None
    return obj

# Example usage
if __name__ == '__main__':
    # Read nested object from user
    nested_obj_input = input("Enter the nested object: ")

    # Read keys from user (separated by slash)
    keys_input = input("Enter the keys (slash-separated): ")

    try:
        # Convert the input to a dictionary object
        nested_obj = eval(nested_obj_input)

        # Get the values for the keys
        keys = keys_input.split('/')
        value = get_value_from_nested_object(nested_obj, keys)

        # Print the result
        print(f"Value for keys '{keys_input}': {value}")
    except Exception as e:
        print("Invalid input:", str(e))

