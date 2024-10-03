sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'fleetmanager/fleet/test/integration/FirstJourney',
		'fleetmanager/fleet/test/integration/pages/CarList',
		'fleetmanager/fleet/test/integration/pages/CarObjectPage'
    ],
    function(JourneyRunner, opaJourney, CarList, CarObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('fleetmanager/fleet') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCarList: CarList,
					onTheCarObjectPage: CarObjectPage
                }
            },
            opaJourney.run
        );
    }
);