$(document).ready(function () {
  function healthCareDisplayName(healthCare) {
    return [healthCare.code, healthCare.name].join(' - ');
  }

  $('#medical_order_patient_id').on('change', function (evt) {
    var patientID = this.value;
    var $medicalOrderHealthCareID = $('#medical_order_health_care_id');
    var options = $medicalOrderHealthCareID.prop('options');

    $medicalOrderHealthCareID.prop('disabled', true);

    if (!patientID) {
      $('option', $medicalOrderHealthCareID).remove();
      $('#affiliate_no').text('');
      return;
    }

    $.getJSON('/admin/health_cares_patients', {
      q: { patient_id_eq: patientID }
    }, function(affiliations) {
      var health_care_ids = affiliations.map(function (affiliation) {
        return affiliation.health_care_id
      });
      var activeHealthCare = affiliations.find(function (affiliation) {
        return affiliation.active
      });

      var activeHealthCareID = activeHealthCare ? activeHealthCare.id : health_care_ids[0];

      $.getJSON('/admin/health_cares', {
        q: { id_in: health_care_ids }
      }, function (healthCares) {
        $('option', $medicalOrderHealthCareID).remove();

        $.each(healthCares, function (index) {
          var healthCareID = this.id;
          var option = new Option(healthCareDisplayName(this), healthCareID);
          var affiliation_no = affiliations.find(function (affiliation) {
            return affiliation.health_care_id == healthCareID;
          }).affiliate_no;

          option.setAttribute('data-affiliate-no', affiliation_no);
          options[options.length] = option;
        });

        $medicalOrderHealthCareID.val(activeHealthCareID);
        var affiliation_no = $medicalOrderHealthCareID.find('option[value='+activeHealthCareID+']').data('affiliate-no');
        $('#affiliate_no').text(affiliation_no);
        $medicalOrderHealthCareID.prop('disabled', false);
      });
    });
  });

  $('#medical_order_health_care_id').on('change', function (evt) {
    if (!this.value) {
      return;
    }
    var optionIndex = this.options.selectedIndex;
    var option = this.options.item(optionIndex);
    var affiliation_no = option.getAttribute('data-affiliate-no');
    $('#affiliate_no').text(affiliation_no);
  });
});

