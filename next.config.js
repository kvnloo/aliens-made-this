/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  images: {
    unoptimized: true,
  },
  basePath: '/aliens-made-this',
  assetPrefix: '/aliens-made-this/',
};

module.exports = nextConfig;
