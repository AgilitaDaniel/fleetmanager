using { fleetmanagerSrv } from '../srv/service.cds';

annotate fleetmanagerSrv.Brand with @UI.HeaderInfo: { TypeName: 'Brand', TypeNamePlural: 'Brands' };
annotate fleetmanagerSrv.Brand with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate fleetmanagerSrv.Brand with {
  name @title: 'Name';
  country @title: 'Country'
};

annotate fleetmanagerSrv.Brand with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: country }
];

annotate fleetmanagerSrv.Brand with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: country }
  ]
};

annotate fleetmanagerSrv.Brand with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate fleetmanagerSrv.Brand with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate fleetmanagerSrv.Car with @UI.HeaderInfo: { TypeName: 'Car', TypeNamePlural: 'Cars' };
annotate fleetmanagerSrv.Car with {
  fleet @Common.ValueList: {
    CollectionPath: 'Fleet',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: fleet_ID, 
        ValueListProperty: 'ID'
      },
    ],
  }
};
annotate fleetmanagerSrv.Car with @UI.DataPoint #brand: {
  Value: brand,
  Title: 'Brand',
};
annotate fleetmanagerSrv.Car with @UI.DataPoint #model: {
  Value: model,
  Title: 'Model',
};
annotate fleetmanagerSrv.Car with @UI.DataPoint #year: {
  Value: year,
  Title: 'Year',
};
annotate fleetmanagerSrv.Car with {
  brand @title: 'Brand';
  model @title: 'Model';
  year @title: 'Year';
  color @title: 'Color';
  licensePlate @title: 'License Plate'
};

annotate fleetmanagerSrv.Car with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: year },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: licensePlate }
];

annotate fleetmanagerSrv.Car with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: year },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: licensePlate }
  ]
};

annotate fleetmanagerSrv.Car with {
  fleet @Common.Label: 'Fleet'
};

annotate fleetmanagerSrv.Car with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#brand' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#model' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#year' }
];

annotate fleetmanagerSrv.Car with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate fleetmanagerSrv.Car with @UI.SelectionFields: [
  fleet_ID
];

annotate fleetmanagerSrv.Fleet with @UI.HeaderInfo: { TypeName: 'Fleet', TypeNamePlural: 'Fleets' };
annotate fleetmanagerSrv.Fleet with {
  cars @Common.Label: 'Cars'
};

annotate fleetmanagerSrv.Fleet with @UI.Facets: [
  { $Type : 'UI.ReferenceFacet', ID : 'Car', Target : 'cars/@UI.LineItem' }
];

