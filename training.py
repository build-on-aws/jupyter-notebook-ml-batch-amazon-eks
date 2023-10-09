import pandas as pd
import xgboost as xgb
import warnings

# Map string labels to integers
label_map = {'Comfortable': 0, 'Uncomfortable': 1}

# Ignore deprecation warnings
warnings.filterwarnings(action='ignore', category=FutureWarning)

# Function to load dataset
def load_training_data(file_path):
    data = pd.read_csv(file_path)
    
    # Convert object-type columns to float
    for col in ['Temperature', 'Humidity']:
        data[col] = pd.to_numeric(data[col], errors='coerce')

    return data

# Function to train the classifier
def train_classifier(data):
    # Encode labels
    data['Label'] = data['Label'].map(label_map)

    # Verify that encoding was successful
    print("Labels after encoding:")
    print(data['Label'].head())
  
    model = xgb.XGBClassifier()
    model.fit(data.drop('Label', axis=1), data['Label'])
    return model

# Main function
def execute_training():
    print("Starting training process...")
  
    # Load data
    training_data = load_training_data('training.csv')

    # Train and save model
    model = train_classifier(training_data)
    model.save_model('xgb-model.model')

    print("Training completed.")

if __name__ == "__main__":
    execute_training()