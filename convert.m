% Define the folder containing .mat files
input_folder = './rat_data'; % Replace with your folder path
output_folder = './rat_data_73'; % Where the converted files will be saved

% Create the output folder if it doesn't exist
if ~exist(output_folder, 'dir')
    mkdir(output_folder);
end

% Get a list of all .mat files in the input folder
mat_files = dir(fullfile(input_folder, '*.mat'));

% Loop through each .mat file
for i = 1:length(mat_files)
    % Get the input file name and path
    input_file = fullfile(input_folder, mat_files(i).name);
    fprintf('Processing file: %s\n', mat_files(i).name);

    % Load the data
    data = load(input_file);

    % Generate the output file name
    [~, name, ~] = fileparts(mat_files(i).name);
    output_file = fullfile(output_folder, [name, '_v7.3.mat']);

    % Save in v7.3 format
    save(output_file, '-struct', 'data', '-v7.3');
    fprintf('Saved converted file to: %s\n', output_file);
end

disp('All files converted to v7.3 format.');
