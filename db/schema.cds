namespace fleetmanager;
using { cuid } from '@sap/cds/common';

entity Brand : cuid {
  name: String(100);
  country: String(100);
}

entity Car : cuid {
  brand: String(100);
  model: String(100);
  year: Integer;
  color: String(20);
  licensePlate: String(10);
  fleet: Association to Fleet;
}

entity Fleet : cuid {
  cars: Composition of many Car on cars.fleet = $self;
}

