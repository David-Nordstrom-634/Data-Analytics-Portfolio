import pandas as pd

file_path = r"C:\Projects\Data-Analytics-Portfolio\Projects\02-Customer-Behavior\online_retail_customer_analysis.xlsx"

df_2009 = pd.read_excel(
    file_path,
    sheet_name="Year 2009-2010"
)

df_2010 = pd.read_excel(
    file_path,
    sheet_name="Year 2010-2011"
)

full_dataset = pd.concat(
    [df_2009, df_2010],
    ignore_index=True
)

print(full_dataset.shape)

invoices = pd.read_csv(
    r"C:\Projects\Data-Analytics-Portfolio\Projects\02-Customer-Behavior\data\staging\invoices.csv"
)

print(invoices.shape)
print(invoices.head())

full_dataset["Invoice"] = (
    full_dataset["Invoice"]
    .astype("string")
    .str.strip()
)

invoices["Invoice"] = (
    invoices["Invoice"]
    .astype("string")
    .str.strip()
)

full_dataset["InvoiceDate"] = pd.to_datetime(
    full_dataset["InvoiceDate"]
)

invoices["InvoiceDate"] = pd.to_datetime(
    invoices["InvoiceDate"]
)

print("Full Dataset Invoice dtype:", full_dataset["Invoice"].dtype)
print("Invoices CSV Invoice dtype:", invoices["Invoice"].dtype)

print(full_dataset["Invoice"].head(10))
print(invoices["Invoice"].head(10))

invoice_items = full_dataset.merge(
    invoices[["invoice_id", "Invoice", "InvoiceDate"]],
    on=["Invoice", "InvoiceDate"],
    how="left"
)

print("Rows after merge:", len(invoice_items))
print("Missing invoice IDs:", invoice_items["invoice_id"].isna().sum())

invoice_items = invoice_items[
    [
        "invoice_id",
        "StockCode",
        "Quantity",
        "Price"
    ]
].copy()

invoice_items.insert(
    0,
    "invoice_line_id",
    range(1, len(invoice_items) + 1)
)

invoice_items = invoice_items.rename(
    columns={
        "StockCode": "stock_code",
        "Quantity": "quantity",
        "Price": "price"
    }
)

print("Rows:", len(invoice_items))
print("Unique line IDs:", invoice_items["invoice_line_id"].nunique())
print("Missing invoice IDs:", invoice_items["invoice_id"].isna().sum())
print("Missing StockCodes:", invoice_items["stock_code"].isna().sum())
print("Missing quantities:", invoice_items["quantity"].isna().sum())
print("Missing prices:", invoice_items["price"].isna().sum())

products = pd.read_csv(
    r"C:\Projects\Data-Analytics-Portfolio\Projects\02-Customer-Behavior\data\staging\products.csv"
)

products = products.rename(
    columns={
        "StockCode": "stock_code",
        "Description": "description"
    }
)

products["stock_code="] = (
    products["stock_code"]
    .astype("string")
    .str.strip()
)

invoice_items["stock_code"] = (
    invoice_items["stock_code"]
    .astype("string")
    .str.strip()
)

invalid_products = ~invoice_items["stock_code"].isin(
    products["stock_code"]
)

print("Invalic product links:", invalid_products.sum())

output_path = r"C:\Projects\Data-Analytics-Portfolio\Projects\02-Customer-Behavior\data\staging\invoice_items.csv"

invoice_items.to_csv(
    output_path,
    index=False
)

print("Export complete.")

check_file = pd.read_csv(
    r"C:\Projects\Data-Analytics-Portfolio\Projects\02-Customer-Behavior\data\staging\invoice_items.csv",
    usecols=["invoice_line_id"]
)

print("Rows in exported CSV:", len(check_file))
print("Maximum line ID:", check_file["invoice_line_id"].max())