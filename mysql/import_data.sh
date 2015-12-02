#!/bin/bash

echo "Import Data"

mysql  <  /tmp/01ProductFeature.sql
mysql  < /tmp/02ProductType.sql
mysql  < /tmp/03Producer.sql
mysql  < /tmp/04Product.sql
mysql  < /tmp/05ProductTypeProduct.sql
mysql  < /tmp/06ProductFeatureProduct.sql
mysql  < /tmp/07Vendor.sql
mysql  < /tmp/08Offer.sql
mysql  < /tmp/09Person.sql
mysql  < /tmp/10Review.sql

echo "Done!"
