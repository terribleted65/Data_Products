Coursera - Data Products (Product Quantiles Application)
========================================================
author: Mike Munster 
date: 05/18/2015

Pricing Quantiles Overview
========================================================

- The catalog quantile comparison is one method used by XYZ.com to evaluate how the prices of products in categories changes
- The customer base is very price sensitive and this application allows management to quickly evaluate how the shift in price might be impacting the number of items sold
- The catalog data used is a random sample of 10,000 items from a catalog of millions of products.

Snapshot from the April 23rd Catalog
========================================================


```
  Department ProductGroup Price    Type
1       mens      apparel    88   PANTS
2       mens      apparel    88   PANTS
3       mens      apparel    85 SWEATER
4       mens      apparel    85 SWEATER
5       mens      apparel    85 SWEATER
6       mens      apparel    88   SHIRT
```

Product Type Count of April 23 Catalog
========================================================


```
        Type freq
1   BED_BATH  449
2     BLAZER   99
3      DRESS  709
4  FURNITURE  137
5       HOME 4409
6    KITCHEN    5
7  OUTERWEAR  470
8      PANTS 1589
9      SHIRT 1373
10    SHORTS  128
11     SKIRT   94
12      SUIT   47
13   SWEATER  373
14  SWIMWEAR  118
```

Product Quantile Application
========================================================

- The Shiny UI takes two inputs: Catalog Date, Product Group
- The Shiny Server contains two functions.  The first determines which catalog the user wishes to evaluate and then calls to calculate the quantiles the quantiles for product types in the product group requested.
- The Shiny Server quantiles are calculated using tapply function
