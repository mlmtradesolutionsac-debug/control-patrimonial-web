import pandas as pd

filename = r'DATA SIGA 15-12-2025.xlsx'

try:
    xl_file = pd.ExcelFile(filename)
    print('Found', len(xl_file.sheet_names), 'sheets')
    print('Sheet names:', xl_file.sheet_names)

    # Read the sheet
    df = pd.read_excel(filename, sheet_name='DATOS ', dtype=str)
    print('Shape of sheet:', df.shape)

    # More comprehensive search for variations of CAL 2025 and 2801
    print('Searching more thoroughly...')

    # Look for 2801 occurrences
    print('\nSearching for 2801:')
    found_2801_anywhere = False
    for idx, row in df.iterrows():
        for col_idx, val in enumerate(row):
            if pd.notna(val) and '2801' in str(val):
                print(f'  Found 2801 in row {idx+1}, column {col_idx} ({df.columns[col_idx]}): {val}')
                found_2801_anywhere = True

    # Look for CAL 2025 variations
    print('\nSearching for CAL 2025 variations:')
    found_cal_anywhere = False
    for idx, row in df.iterrows():
        for col_idx, val in enumerate(row):
            cell_str = str(val).upper() if pd.notna(val) else ''
            if 'CAL' in cell_str and '2025' in cell_str:
                print(f'  Found CAL variation in row {idx+1}, column {col_idx} ({df.columns[col_idx]}): {val}')
                found_cal_anywhere = True

            elif '2025' in cell_str and 'CAL' in cell_str.lower():
                print(f'  Found possible match in row {idx+1}, column {col_idx} ({df.columns[col_idx]}): {val}')
                found_cal_anywhere = True

    print('\nLooking for rows that might contain both values:')
    for idx, row in df.iterrows():
        row_str = ' '.join([str(val) for val in row if pd.notna(val)])
        if ('CAL' in row_str.upper() or '2025' in row_str) and '2801' in row_str:
            print(f'  Both terms found in row {idx+1}: row contains both terms')
            for col_idx, val in enumerate(row):
                if pd.notna(val) and ('CAL' in str(val).upper() or '2025' in str(val) or '2801' in str(val)):
                    print(f'    Column {col_idx} ({df.columns[col_idx]}): {val}')

    print(f'\nSUMMARY - CAL 2025 found: {found_cal_anywhere}, 2801 found: {found_2801_anywhere}')

except Exception as e:
    print(f"Error: {e}")
    import traceback
    traceback.print_exc()