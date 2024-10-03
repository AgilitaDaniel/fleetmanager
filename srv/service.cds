using { fleetmanager as my } from '../db/schema.cds';

@path: '/service/fleetmanager'
@requires: 'authenticated-user'
service fleetmanagerSrv {
  @odata.draft.enabled
  entity Brand as projection on my.Brand;
  @odata.draft.enabled
  entity Fleet as projection on my.Fleet;
}