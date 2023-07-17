import json
import boto3

def get_instance_metadata(data_key):
    # Create a Boto3 EC2 client
    ec2_client = boto3.client('ec2')

    # Retrieve instance metadata
    response = ec2_client.describe_instances()
    instance_metadata = response['Reservations'][0]['Instances'][0]

    # Check if the data key exists in the metadata
    if data_key in instance_metadata:
        # Return the value of the specified data key
        return instance_metadata[data_key]
    else:
        return None

# Function to retrieve available data keys from the instance metadata
def get_available_data_keys(instance_metadata):
    return list(instance_metadata.keys())

# Example usage
if __name__ == '__main__':
    # Create a Boto3 EC2 client
    ec2_client = boto3.client('ec2')

    # Retrieve instance metadata
    response = ec2_client.describe_instances()
    instance_metadata = response['Reservations'][0]['Instances'][0]

    # Get the available data keys
    available_data_keys = get_available_data_keys(instance_metadata)

    # Display available data keys to the user
    print("Available Data Keys:")
    for i, key in enumerate(available_data_keys, start=1):
        print(f"{i}. {key}")

    # Prompt user for the desired data key
    choice = int(input("Enter the number corresponding to the data key: "))
    if choice >= 1 and choice <= len(available_data_keys):
        data_key = available_data_keys[choice - 1]

        # Retrieve the value of the specified data key from instance metadata
        metadata_value = get_instance_metadata(data_key)

        if metadata_value:
            # Create a dictionary with the specified data key and its value
            metadata_dict = {data_key: metadata_value}

            # Convert the dictionary to JSON format
            json_metadata = json.dumps(metadata_dict, indent=4, sort_keys=True, default=str)

            # Print the JSON-formatted metadata
            print(json_metadata)
        else:
            print(f"Metadata key '{data_key}' not found.")
    else:
        print("Invalid choice. Please enter a valid number corresponding to the data key.")
