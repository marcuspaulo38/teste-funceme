<template>
  <site-template>
    <form-new-meeting class="mb-4"/>
    <filter-meetings class="mb-4" :updateMeetings="updateMeetings"></filter-meetings>
    <div class="container mb-4">
      <div v-for="meeting in meetings" :key="meeting.id">
        <meeting :meeting="meeting"></meeting>
      </div>
    </div>
    <schedule :meetings="meetings"></schedule>
  </site-template>
</template>

<script>

import SiteTemplate from '@/templates/SiteTemplate';
import FormNewMeeting from '@/components/FormNewMeeting';
import Schedule from '@/components/Schedule';
import FilterMeetings from '@/components/FilterMeetings';
import Meeting from '@/components/Meeting';

export default {
  name: 'Home',
  components: {
    SiteTemplate,
    FormNewMeeting,
    Schedule,
    FilterMeetings,
    Meeting
  },
  data(){
    return{
      meetings: [],
    }
  },
  methods:{
    updateMeetings(data){
      this.meetings = data;
    }
  }
}
</script>

<style scoped>
</style>
