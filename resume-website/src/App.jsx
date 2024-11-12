import './App.css'
import { useEffect, useState } from 'react';
// Top portfolio imports
import GithubIcon from './assets/github.png'
import DevTo from './assets/devto.png'
import LinkedIn from './assets/linkedin.png'

// Skill imports
import aws from './assets/aws.png'
import Git from './assets/git.png'
import Linux from './assets/linux.png'
import Terraform from './assets/terraform.png'
import npm from './assets/npm.png'
import react from './assets/react.png'

export default function App() {
  const [counter, setCounter] = useState('');

  useEffect(() => {
    async function updateCounter() {
      try {
        const response = await fetch("https://y7fvvgj0lf.execute-api.ap-south-1.amazonaws.com/count"); // Replace "api-url" with your actual endpoint
        const data = await response.json();
        console.log('Count:', data);
        setCounter(data);
      } catch (error) {
        console.error("Error fetching counter:", error);
      }
    }
    updateCounter();
  }, []); // Empty dependency array to run once on component mount
  return (
    <div className="w-full max-w-4xl mx-auto text-center border-2 border-black mt-4 rounded-3xl overflow-hidden bg-white" id='MainPage'>
      <div id='CounterDiv' className="bg-black">
        <h2 className="text-white text-3xl p-4" id='counter'>{counter}</h2>
      </div>
      <div id='Nameplate' className='text-7xl pt-5'>
        <h1>ADITYA PANDEY</h1>
      </div>
      <div id='Links&ContactInfo' className='space-x-5 pt-5'>
        <a 
          href='https://github.com/AdityaPGit' 
          className='inline-block group'
          target='_blank'
        >
          <button 
            className='bg-black flex items-center p-2 h-14 rounded-full text-neutral-50 transition duration-300 ease-in-out border border-black hover:bg-white hover:text-black'
          >
            <img 
              src={GithubIcon} 
              alt="Github Logo" 
              className='w-16 object-cover transition duration-300 ease-in-out group-hover:invert'
            />
            <h1 className='text-neutral-50 text-xl pl-1 pr-2 transition duration-300 ease-in-out group-hover:text-black'>/AdityaPGit</h1>
          </button>
        </a>
        <a 
          href='https://dev.to/pandeyaditya' 
          className='inline-block group'
          target='_blank'
        >
          <button 
            className='bg-black flex items-center p-2 h-14 rounded-full text-neutral-50 transition duration-300 ease-in-out border border-black hover:bg-white hover:text-black'
          >
            <img 
              src={DevTo} 
              alt="DEV Logo" 
              className='w-16 object-cover transition duration-300 ease-in-out group-hover:invert'
            />
            <h1 className='text-neutral-50 text-xl pl-1 pr-2 transition duration-300 ease-in-out group-hover:text-black'>/pandeyaditya</h1>
          </button>
        </a>
        <a 
          href='https://www.linkedin.com/in/pandeyaditya19/' 
          className='inline-block group'
          target='_blank'
        >
          <button 
            className='bg-black flex items-center p-2 h-14 rounded-full text-neutral-50 transition duration-300 ease-in-out border border-black hover:bg-white hover:text-black'
          >
            <img 
              src={LinkedIn} 
              alt="LinkedIn Logo" 
              className='w-16 object-cover transition duration-300 ease-in-out group-hover:invert'
            />
            <h1 className='text-neutral-50 text-xl pl-1 pr-2 transition duration-300 ease-in-out group-hover:text-black'>/pandeyaditya19</h1>
          </button>
        </a>
      </div>
      <hr className='border-t-2 border-black my-4 py-0'/>
        <h1 className='text-3xl text-left pl-4'>Projects</h1>
        <hr className='border-t-2 border-black my-4 py-0'/>
        <div className='m-5'>
        <div id='Project'>
          <h2 className='text-2xl'>Cloud Resume Challenge</h2>
          <hr className='border-t-1 border-black my-4 py-0'/>
          <div className='flex items-center justify-center'>
            <div className='w-4/5 text-justify border-r border-black pr-5 ml-4'>
              Completed the Cloud Resume Challenge by creating a personal resume website hosted on AWS. Leveraged S3 for static site hosting, configured CloudFront for content delivery, and used GitHub Actions for CI/CD to automatically deploy updates. Integrated visitor counter using AWS Lambda and DynamoDB, enabling real-time tracking. This project showcased my skills in cloud infrastructure, automation, and serverless architecture.
            </div>
            <div className='w-full md:w-1/5 flex flex-col space-y-2 pl-3'>
              <a href="https://dev.to/pandeyaditya/cloud-resume-challenge-aws-1pc5" target="_blank" rel="noopener noreferrer">
                <button 
                  className='w-full border border-black text-black bg-white p-2 rounded transition duration-150 ease-in-out hover:bg-black hover:text-white'
                >
                  <span className='transition duration-100 ease-in-out'>Blog</span>
                </button>
              </a>
              <a href="https://github.com/AdityaPGit/Cloud-Resume-Challenge-AWS" target="_blank" rel="noopener noreferrer">
                <button 
                  className='w-full border border-black text-black bg-white p-2 rounded transition duration-150 ease-in-out hover:bg-black hover:text-white'
                >
                  <span className='transition duration-100 ease-in-out'>Repository</span>
                </button>
              </a>
            </div>
          </div>
        </div>
      </div>
      <hr className='border-t-2 border-black my-4 py-0'/>
      <h1 className='text-3xl text-left pl-4'>Skills</h1>
      <hr className='border-t-2 border-black my-4 py-0'/>
      <div className='p-4 flex space-x-2'>
        <div className='relative group'>
          <img src={aws} alt="AWS" className='transition-transform duration-300 ease-in-out group-hover:scale-110 w-16' />
          <span className='absolute bottom-0 left-1/2 transform -translate-x-1/2 text-white bg-black p-1 rounded opacity-0 group-hover:opacity-100 transition-opacity duration-300 bg-opacity-80 group-hover:bg-opacity-100'>AWS</span>
        </div>
        <div className='relative group'>
          <img src={Terraform} alt="Terraform" className='transition-transform duration-300 ease-in-out group-hover:scale-110 w-18' />
          <span className='absolute bottom-0 left-1/2 transform -translate-x-1/2 text-white bg-black p-1 rounded opacity-0 group-hover:opacity-100 transition-opacity duration-300 bg-opacity-80 group-hover:bg-opacity-100'>Terraform</span>
        </div>
        <div className='relative group'>
          <img src={react} alt="React" className='transition-transform duration-300 ease-in-out group-hover:scale-110 w-18' />
          <span className='absolute bottom-0 left-1/2 transform -translate-x-1/2 text-white bg-black p-1 rounded opacity-0 group-hover:opacity-100 transition-opacity duration-300 bg-opacity-80 group-hover:bg-opacity-100'>React</span>
        </div>
        <div className='relative group'>
          <img src={npm} alt="NPM" className='transition-transform duration-300 ease-in-out group-hover:scale-110 w-18' />
          <span className='absolute bottom-0 left-1/2 transform -translate-x-1/2 text-white bg-black p-1 rounded opacity-0 group-hover:opacity-100 transition-opacity duration-300 bg-opacity-80 group-hover:bg-opacity-100'>NPM</span>
        </div>
        <div className='relative group'>
          <img src={Linux} alt="Linux" className='transition-transform duration-300 ease-in-out group-hover:scale-110 w-18' />
          <span className='absolute bottom-0 left-1/2 transform -translate-x-1/2 text-white bg-black p-1 rounded opacity-0 group-hover:opacity-100 transition-opacity duration-300 bg-opacity-80 group-hover:bg-opacity-100'>Linux</span>
        </div>
        <div className='relative group'>
          <img src={Git} alt="Git" className='transition-transform duration-300 ease-in-out group-hover:scale-110 w-18' />
          <span className='absolute bottom-0 left-1/2 transform -translate-x-1/2 text-white bg-black p-1 rounded opacity-0 group-hover:opacity-100 transition-opacity duration-300 bg-opacity-80 group-hover:bg-opacity-100'>Git</span>
        </div>
      </div>
    </div>
  )
}