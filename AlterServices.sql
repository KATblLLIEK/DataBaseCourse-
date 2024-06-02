ALTER TABLE "Services"
ADD CONSTRAINT "PK_Services"
PRIMARY KEY ("ServiceID");

ALTER TABLE "Services"
ALTER COLUMN "ServiceName"
SET NOT NULL;

ALTER TABLE "Services"
ALTER COLUMN "ServiceCost"
SET NOT NULL;

ALTER TABLE "Services"
ADD CONSTRAINT "U_Services_ServiceName"
UNIQUE ("ServiceName");